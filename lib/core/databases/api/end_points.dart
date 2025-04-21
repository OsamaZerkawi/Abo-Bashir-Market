class EndPoint {
  static String baseUrl = "http://192.168.1.6:8000/api/";
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

  //! Product Endpoints
  static String getAllProducts = 'products';
  static String getProductById = 'products'; // /{id}
  static String createProduct = 'products';
  static String updateProduct = 'products'; // /{id}
  static String deleteProduct = 'products'; // /{id}

  // static String getUserDataEndPoint(id) {
  //   return "user/get-user/$id";
  // }
}

class ApiKey {
  //*Start login
  static String email = "email";
  static String password = "password";
  static String fcm_token = "fcm_token";
  static String remember_me = "remember_me";
  static String successful = "successful";
  static String message = "message";
  static String status_code = "status_code";
  static String data = "data";
  static String user = "user";
  static String first_name = "first_name";
  static String last_name = "last_name";
  static String image = "image";
  static String token = "token";
  static String id = 'id';
  // static String refreshToken = 'refreshToken';
  static String Authorization = 'Authorization';
  //*End Login

  //*Start SignUp
  static String passwordConfirm = "password_confirmation";
  static String appPassword = "app_password";
  //*end SignUp

  static String otp = "otp";

  static String subject = "subject";

  //*Product

  static String Products = "Products";
  static String product = "product";

  static String name = "name";
  static String page = "page";
  static String items = "items";
  static String column = "column";
  static String direction = "direction";
  static String price = "price";
  static String category = "category";
  static String amounts = "amounts";
  static String total_pages = "total_pages";
  static String current_page = "current_page";
  static String hasMorePages = "amounts";
  static String category_id = "category_id";

  static String classification = "classification";
  static String quantity = "quantity";

  static String asc = "asc";
  static String desc = "desc";
  static String current_price = "current_price";

  static String old_price = "old_price";

  // static String errorMessage = "ErrorMessage";
  // static String id = "id";
  // static String phone = "phone";
  // static String confirmPassword = "confirmPassword";
  // static String location = "location";
  // static String profilePic = "profilePic";
}
