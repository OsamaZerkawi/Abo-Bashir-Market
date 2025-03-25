class ErrorModel {
  final bool successful;
  final String message;
  final dynamic data;
  final String statusCode;

  ErrorModel({
    required this.successful,
    required this.message,
    this.data,
    required this.statusCode,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      successful: jsonData[''],
      message: jsonData[''],
      data: jsonData[''],
      statusCode: jsonData[''],
    );
  }

  // ErrorModel({required this.status, required this.errorMessage});
  // factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
  //   return ErrorModel(
  //     status: jsonData[ApiKey.status],
  //     errorMessage: jsonData[ApiKey.errorMessage],
  //   );
  // }
}

// {
//   "successful": false,
//   "message": "Validation failed",
//   "data": {
//     "email": "The email has already been taken.",
//     "password": "The password field confirmation does not match.",
//     "password_confirmation": "The password confirmation field must match password.",
//     "app_password": "The selected app password is invalid."
//   },
//   "status_code": 400
// }
