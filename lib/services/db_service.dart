class User {
  String email;
  String password;

  User(this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserSignUp {
  String emailSignUp;
  String passwordSignUp;
  String addressSignUp;

  UserSignUp(this.emailSignUp, this.passwordSignUp, this.addressSignUp);

  UserSignUp.fromJson(Map<String, dynamic> json)
      : emailSignUp = json["emailSignUp"],
        passwordSignUp = json["passwordSignUp"],
        addressSignUp = json["addressSignUp"];

  Map<String, dynamic> toJson() => {
        "emailSignUp": emailSignUp,
        "passwordSignUp": passwordSignUp,
        "addressSignUp": addressSignUp,
      };
}
