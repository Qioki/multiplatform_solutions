class User {
  final String name;
  final String lastname;
  final String email;
  final String image;

  User({
    required this.name,
    required this.lastname,
    required this.email,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      image: json['image'],
    );
  }
}
