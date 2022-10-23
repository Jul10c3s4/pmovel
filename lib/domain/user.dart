class User {
  late final String userName;
  late final String userEmail;
  late final String password;


  User({required this.userName, required this.userEmail, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['password'] = this.password;
    return data;
  }
}