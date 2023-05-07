class LoginModel {
  String email;
  String name;
  String token;

  LoginModel(
      {required this.email, required this.name, required this.token});

  factory LoginModel.initial() => LoginModel(email: '', name: '', token: '');

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json["email"] ?? '',
      name: json["name"]?? '',
      token: json["token"]?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "token": token,
    };
  }
}