import 'package:story_app/l10n/app_localizations.dart';

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([super.locale = 'en']);

  @override
  String get titleLogin => 'Welcome Back';

  @override
  String get titleRegister => 'Create Your Account';

  @override
  String get email => 'Email Addres';

  @override
  String get name => 'Name';

  @override
  String get password => 'Password';

  @override
  String get loginButton => 'Log in';

  @override
  String get registerButton => 'Sign up';

  @override
  String get loginGoButton => 'New user? Sign up';

  @override
  String get regGoButton => 'Already have an account? Log in';

  @override
  String get validationEmail => 'Please enter a valid email addres.';

  @override
  String get validationName => 'Name must be at least 4 characters long.';

  @override
  String get validationPw => 'Password must be at least 8 characters long.';

  @override
  String get stories => 'Stories';

  @override
  String get addStory => 'Add Story';

  @override
  String get settings => 'Settings';

  @override
  String get labelDesc => 'Enter your description here...';

  @override
  String get noImage => 'No Image';

  @override
  String get upload => 'Upload';

  @override
  String get addBio => 'Add';

  @override
  String get userName => 'Username';

  @override
  String get phone => 'Phone';

  @override
  String get logout => 'Logout';

  @override
  String get logoutDesc => 'Are you sure want to logout?';

  @override
  String get cancel => 'Cancel';
}
