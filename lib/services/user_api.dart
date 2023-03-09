import 'dart:convert';
import '../screens/user_name.dart';
import 'package:http/http.dart' as http;
import '../models/userdata.dart';

class UserApi{
 static Future<List<User>> fetchUsers() async {
    final String url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      final name = userName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        username: name,
      );
    }).toList();

    return users;

  }
}
