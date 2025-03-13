class User {
  String firstName;
  String lastName;
  String email;
  String phone;
  String appPassword;
  String image;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.appPassword,
    required this.image,
  });

  // Implement fromJson and toJson methods to serialize/deserialize the data
}
