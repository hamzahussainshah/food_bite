class ApiEndPoints {
  static const signup = "auth/register";
  static const login = "auth/login";
  static const logout = "auth/logout";
  static const resetPassword = "user/reset-password";
  static const sendVerificationOtp = "auth/send-verify-otp";
  static const verifyOTP = "user/verify-reset-otp";
  static const sendPasswordResetOtp = "user/send-reset-otp";
  static const verifyPasswordResetOTP = "auth/verify-reset-otp";
  static const isLoggedIn = "auth/is-auth";
  static const deleteAccount = "auth/deleteAccount";
  static const userProfile = "user/profile";

  static const getMenu = "menu";
  static const order = "order";
  static const reservations = "reservations";
  static const reviews = "reviews";

  static var address = "user/address";
}
