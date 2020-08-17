class User{
  final String authorization;
  final bool success;
  User({this.authorization,this.success});
  factory User.fromJson(Map<String,dynamic> json){
    return User(
      authorization: json['authToken'],
      success: json['success'],
    );
  }
}