class IugUser {
  String email;
  String password;
  IugUser({required this.email, required this.password});
  toMap() {
    return {'Email': email, "Password": password};
  }
}
