import '../enums/env.dart';

class Config {
  late final Env _env;
  final String _devBaseUrl = 'https://http://restaurant-customer-seven.vercel.app';
  final String _testBaseUrl = 'https://http://restaurant-customer-seven.vercel.app';
  final String _productionBaseUrl =
      'https://http://restaurant-customer-seven.vercel.app';

  late String _baseUrl;

  /// Getters
  Env get env => _env;
  String get baseUrl => _baseUrl;
  String get fcmServerKey => "";

  /// Constructor
  Config() {
    _env = _getEnvironment(); // Set the environment internally
    _setupBaseUrl();
  }

  /// Function to determine environment
  Env _getEnvironment() {
    // You can implement any logic here to determine the environment
    // For example, you could check some environment variables or conditions
    // By default, we'll return the development environment
    const String currentEnv =
        String.fromEnvironment('ENV', defaultValue: 'dev');

    switch (currentEnv) {
      case 'production':
        return Env.production;
      case 'test':
        return Env.test;
      case 'dev':
      default:
        return Env.dev;
    }
  }

  _setupBaseUrl() {
    if (_env == Env.production) {
      _baseUrl = _productionBaseUrl;
    } else if (_env == Env.dev) {
      _baseUrl = _devBaseUrl;
    } else if (_env == Env.test) {
      _baseUrl = _testBaseUrl;
    }
  }
}
