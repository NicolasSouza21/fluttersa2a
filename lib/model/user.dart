class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : username = map['username'],
        password = map['password'];
}
