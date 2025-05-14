class AppConfig {
  static const String appName = 'QazQuery';
  static const String baseUrl = bool.fromEnvironment('dart.vm.product')
      ? 'https://authserverdart-production.up.railway.app/' // релиз
      : 'http://10.0.2.2:8080'; // debug локально
}
