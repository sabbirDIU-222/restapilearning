import 'package:flutter/material.dart';
import 'package:restapilearning/models/userdata.dart';
import '../services/user_api.dart';

class userdetail extends StatefulWidget {
  @override
  State<userdetail> createState() => _userdetailState();
}

class _userdetailState extends State<userdetail> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('REST api calling'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final phone = user.phone;
          //final color = user.gender == 'male' ? Colors.grey : Colors.white;
          return ListTile(
            title: Text(user.fullname),
            subtitle: Text(phone),
           // tileColor: color,
            onTap: () {},
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async{
   final response = await UserApi.fetchUsers();
   setState(() {
     users = response;
   });
  }


}
