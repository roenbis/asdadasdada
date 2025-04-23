class UserModel {
  String? username;
  String? fullName;
  String? email;
  String? password;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.fullName,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'full_name': fullName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      fullName: map['full_name'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'full_name': fullName,
      'email': email,
      'password': password,
    };
  }
}
