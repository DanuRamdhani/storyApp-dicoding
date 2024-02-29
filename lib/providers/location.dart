import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:story_app/models/response_state.dart';
import 'package:story_app/widgets/custom_snackbar.dart';

class LocationProvider extends ChangeNotifier {
  LatLng initialLoc = const LatLng(-6.8957473, 107.6337669);

  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;
  ResponseState response = const ResponseState.initial();

  geo.Placemark? placemark;
  String address = '';

  void defineMarker(LatLng latLng, String street, String address) {
    markers
      ..clear()
      ..add(
        Marker(
          markerId: const MarkerId('your-loc'),
          position: latLng,
          infoWindow: InfoWindow(
            title: street,
            snippet: address,
          ),
        ),
      );
    notifyListeners();
  }

  Future<void> getMyLocation(
    BuildContext context,
    GoogleMapController mapController,
  ) async {
    final locProv = context.read<LocationProvider>();
    final location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        customSnackBar(context, 'Location services is not available');
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        if (!context.mounted) return;
        customSnackBar(context, 'Location permission is denied');
        return;
      }
    }

    response = const ResponseState.loading();
    notifyListeners();

    locationData = await location.getLocation();

    locProv.initialLoc =
        LatLng(locationData.latitude!, locationData.longitude!);
    debugPrint(locProv.initialLoc.toString());
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;
    address = '${place.subLocality}, ${place.locality}, '
        '${place.postalCode}, ${place.country}';
    placemark = place;
    notifyListeners();

    defineMarker(latLng, street, address);
    await mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );

    response = const ResponseState.loaded();
    notifyListeners();
  }

  Future<void> onTapMap(
    BuildContext context,
    GoogleMapController mapController,
    LatLng latLng,
  ) async {
    final locProv = context.read<LocationProvider>();

    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;
    address = '${place.subLocality}, ${place.locality}, '
        '${place.postalCode}, ${place.country}';

    placemark = place;
    notifyListeners();

    locProv.initialLoc = LatLng(latLng.latitude, latLng.longitude);
    debugPrint(locProv.initialLoc.toString());

    defineMarker(latLng, street, address);

    await mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}
