import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/location.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/models/response_state.dart';
import 'package:story_app/widgets/placemark.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  static const routeName = 'google-map';

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LocationProvider>(
          builder: (context, locProv, _) {
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: locProv.initialLoc,
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                    locProv.getMyLocation(context, mapController);
                  },
                  markers: locProv.markers,
                  mapType: locProv.selectedMapType,
                  zoomControlsEnabled: false,
                  onTap: (argument) =>
                      locProv.onTapMap(context, mapController, argument),
                ),
                if (locProv.placemark != null)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Consumer<StoriesProvider>(
                          builder: (context, storiesProv, _) {
                            return FloatingActionButton.small(
                              backgroundColor:
                                  const Color.fromARGB(255, 83, 238, 163),
                              foregroundColor: Colors.black,
                              heroTag: 'add-loc',
                              onPressed: () {
                                storiesProv.addLocation(context);
                                context.pop();
                                debugPrint(storiesProv.lat.toString());
                                debugPrint(storiesProv.lon.toString());
                              },
                              child:
                                  const Icon(Icons.add_location_alt_outlined),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Placemark(
                          placemark: locProv.placemark!,
                        ),
                      ],
                    ),
                  ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          FloatingActionButton.small(
                            onPressed: null,
                            child: PopupMenuButton<MapType>(
                              onSelected: (MapType item) {
                                setState(() {
                                  locProv.selectedMapType = item;
                                });
                              },
                              offset: const Offset(0, 54),
                              icon: const Icon(Icons.layers_outlined),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<MapType>>[
                                const PopupMenuItem<MapType>(
                                  value: MapType.normal,
                                  child: Text('Normal'),
                                ),
                                const PopupMenuItem<MapType>(
                                  value: MapType.satellite,
                                  child: Text('Satellite'),
                                ),
                                const PopupMenuItem<MapType>(
                                  value: MapType.terrain,
                                  child: Text('Terrain'),
                                ),
                                const PopupMenuItem<MapType>(
                                  value: MapType.hybrid,
                                  child: Text('Hybrid'),
                                ),
                              ],
                            ),
                          ),
                          FloatingActionButton.small(
                            heroTag: 'your-location',
                            onPressed: () {
                              locProv.getMyLocation(context, mapController);
                            },
                            child: const Icon(Icons.my_location),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      FloatingActionButton.small(
                        heroTag: 'zoom-in',
                        onPressed: () {
                          mapController.animateCamera(
                            CameraUpdate.zoomIn(),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton.small(
                        heroTag: 'zoom-out',
                        onPressed: () {
                          mapController.animateCamera(
                            CameraUpdate.zoomOut(),
                          );
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                if (locProv.response == const ResponseState.loading())
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.color.onPrimary,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
