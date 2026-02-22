import 'package:dio/dio.dart';

/// Authentication Interceptor
/// Automatically adds authentication token to requests
class AuthInterceptor extends Interceptor {
  /// Cached token in memory to avoid slow I/O operations on every request
  static String? _cachedToken;

  /// Set the token when user logs in or app starts
  static void setToken(String? token) {
    _cachedToken = token;
  }

  /// Clear the token when user logs out
  static void clearToken() {
    _cachedToken = null;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_cachedToken != null && _cachedToken!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $_cachedToken';
    }
    super.onRequest(options, handler);
  }
}
