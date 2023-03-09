import '../screens/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final userName username;


  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.username,
  });// nat means nationality

String get fullname{
  return '${username.title} ${username.first} ${username.last}';
}


}

