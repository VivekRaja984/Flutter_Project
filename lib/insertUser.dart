import 'package:flutter/material.dart';
import 'package:login/dbHelper.dart';
import 'package:login/user.dart';

class Insertuser extends StatefulWidget {
  const Insertuser({super.key});

  @override
  State<Insertuser> createState() => _InsertuserState();
}

class _InsertuserState extends State<Insertuser> {
  int userCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              User user = User();
              user.FirstName = "vivek";
              user.LastName = "Raja";
              user.Email = "vivek@gmail.com";
              user.Mobile = "1234567890";
              user.Password = "";
              user.Hobbies = "";
              user.Gender = "Male";
              user.City = "Rajkot";
              user.DOB = DateTime.now().toIso8601String();

              DBHelper db = DBHelper();
              userCount = await db.insertUser(user);
              setState(() {

              });
            },
            child: Text("Insert Use"),
          ),
          Text("Count=$userCount"),
        ],
      ),
    );
  }
}
