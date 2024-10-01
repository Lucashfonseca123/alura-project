class BuildConfig {
  static late final BuildConfig instance;

  final String serviceUrl;

  BuildConfig.prod({
    this.serviceUrl = 'https://gist.githubusercontent.com/viniciosneves',
  }) {
    instance = this;
  }
}
