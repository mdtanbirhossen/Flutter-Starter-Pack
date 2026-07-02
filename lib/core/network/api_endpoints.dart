class ApiEndpoints {
  /// Base URL
  static const String baseUrl = 'https://api.example.com/v1';

  /// Auth Endpoints
  static const String login = '$baseUrl/auth/login';
  static const String logout = '$baseUrl/auth/logout';
  static const String register = '$baseUrl/auth/register';

  /// User Endpoints
  static const String profile = '$baseUrl/user/profile';
}
