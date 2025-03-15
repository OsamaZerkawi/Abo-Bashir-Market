class UserModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  String? image;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }
}
