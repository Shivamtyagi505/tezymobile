
class LoginModel {
  LoginModel({
    this.jwt,
    this.user,
  });

  String? jwt;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    jwt: json["jwt"],
    user: User.fromJson(json["user"]),
  );
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    provider: json["provider"],
    confirmed: json["confirmed"],
    blocked: json["blocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
}
