class Api {
  Api._();

  /// URL
  static const String baseUrl = "https://fastapi-books-app.onrender.com";

  /// ENDPOINTS
  // auth
  static const String signUp = "$baseUrl/auth/signup";
  static const String verify = "$baseUrl/auth/verify";
  static const String logIn = "$baseUrl/auth/login";
  static const String forgetPassWord = "$baseUrl/auth/forgot-password";
  static const String forgetPassWordVerify = "$baseUrl/auth/verify-password-reset-otp";
  
}