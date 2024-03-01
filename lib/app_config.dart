enum AppType {
  initial,
  free,
  pay,
}

class AppConfig {
  AppConfig({
    this.appType = AppType.initial,
  }) {
    _instance = this;
  }
  final AppType appType;

  static AppConfig? _instance;

  static final AppConfig instance = _instance ?? AppConfig();
}
