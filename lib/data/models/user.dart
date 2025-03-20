class UserModel {
  String firstName;
  String lastName;
  String email;
 
  String? image;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
    
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
     
      image: json['image'],
    );
  }
}
