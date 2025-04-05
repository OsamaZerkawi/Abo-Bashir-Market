class EndPoint {
  static String baseUrl = "http://192.168.14.38:8000/api/";
  static String signUp = "users/register";
  static String emailVerify = "users/emailVerify";
  static String logIn = "users/login";
  static String logout = "users/logout";
  static String profile = "users/profile";
  static String update = "users/update";
  static String forgetPassword = "users/forgetPassword";
  static String resetPassword = "users/resetPassword";
  static String resendOTP = "users/resendOTP";
  static String delete = "users/delete";
  static String refreshToken = "users/refreshToken";

  // static String getUserDataEndPoint(id) {
  //   return "user/get-user/$id";
  // }
}

class ApiKey {
  //*Start login
  static String email = "email";
  static String password = "password";
  static String fcmToken = "fcm_token";
  static String rememberMe = "remember_me";
  static String successful = "successful";
  static String message = "message";
  static String statusCode = "status_code";
  static String data = "data";
  static String user = "user";
  static String firstName = "first_name";
  static String lastName = "last_name";
  static String image = "image";
  static String token = "token";
  //*End Login

  //*Start SignUp
  static String passwordConfirm = "password_confirmation";
  static String appPassword = "app_password";
  //*end SignUp

  static String otp = "otp";

  static String subject = "subject";

  // static String errorMessage = "ErrorMessage";
  // static String id = "id";
  // static String name = "name";
  // static String phone = "phone";
  // static String confirmPassword = "confirmPassword";
  // static String location = "location";
  // static String profilePic = "profilePic";
}
