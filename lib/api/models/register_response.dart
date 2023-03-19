class RegisterData {
  final String username;
  final String email;
  final String password;
  final String id;

  RegisterData(
      {required this.username,
      required this.email,
      required this.password,
      required this.id});

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        id: json['id']);
  }
}
