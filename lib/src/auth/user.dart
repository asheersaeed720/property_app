class UserModel {
  String username;
  String email;
  String password;

  UserModel({
    this.username = '',
    this.email = '',
    this.password = '',
  });

  @override
  String toString() => 'UserModel(username: $username, email: $email, password: $password)';
}
