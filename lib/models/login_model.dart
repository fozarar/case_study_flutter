class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(dynamic json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
