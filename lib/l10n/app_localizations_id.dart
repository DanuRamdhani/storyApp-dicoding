import 'package:story_app/l10n/app_localizations.dart';

class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([super.locale = 'id']);

  @override
  String get titleLogin => 'Selamat Datang';

  @override
  String get titleRegister => 'Buat Akun Anda';

  @override
  String get email => 'Alamat Email';

  @override
  String get name => 'Nama';

  @override
  String get password => 'Kata Sandi';

  @override
  String get loginButton => 'Masuk';

  @override
  String get registerButton => 'Daftar';

  @override
  String get loginGoButton => 'Pengguna baru? Daftar';

  @override
  String get regGoButton => 'Sudah punya akun? Masuk';

  @override
  String get validationEmail => 'Silakan masukkan alamat email yang valid.';

  @override
  String get validationName => 'Nama harus terdiri dari minimal 4 karakter.';

  @override
  String get validationPw =>
      'Kata sandi harus terdiri dari minimal 8 karakter.';

  @override
  String get stories => 'Cerita';

  @override
  String get addStory => 'Tambah Cerita';

  @override
  String get settings => 'Pengaturan';

  @override
  String get labelDesc => 'Tambahkan deskripsi disini...';

  @override
  String get noImage => 'Tidak Ada Gambar';

  @override
  String get upload => 'Unggah';

  @override
  String get addBio => 'Tambah';

  @override
  String get userName => 'Nama pengguna';

  @override
  String get phone => 'Nomor';

  @override
  String get logout => 'Keluar';

  @override
  String get logoutDesc => 'Apakah kamu yakin ingin keluar?';

  @override
  String get cancel => 'Kembali';
}
