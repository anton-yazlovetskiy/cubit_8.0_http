class User {
  int id;
  String name;
  String? email;

  User({
    required this.id,
    required this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }
}
