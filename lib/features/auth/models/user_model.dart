class UserModel {
  const UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.gender,
    this.age,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? age;

  Map<String, dynamic> toJson() {
    return {
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
    };
  }
}
