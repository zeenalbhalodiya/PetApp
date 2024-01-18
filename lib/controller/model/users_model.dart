class userModel {
  final String? id;
  final String email;
  final String password;
  final String confirmpassword;

  const userModel( {
    this.id,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });
  toJson(){
    return{
    "Email": email,
    "Password": password,
    "Confirm Password": confirmpassword,
    };
  }
}