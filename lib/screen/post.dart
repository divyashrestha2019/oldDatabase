class Post {
  String email;
  String password;
  Post(this.email,this.password);
  Post.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'password': password,
      };
}