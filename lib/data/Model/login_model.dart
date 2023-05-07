class LoginModel {
  String email;
  String password;
  String token;

  LoginModel(
      {required this.email, required this.password, required this.token});

  factory LoginModel.initial() => LoginModel(email: '', password: '', token: '');

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json["email"],
      password: json["password"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "token": token,
    };
  }
}