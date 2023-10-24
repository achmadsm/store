class User {
  final String firstName;
  final String lastName;
  final String image;
  final String token;

  User({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "token": token,
      };
}
