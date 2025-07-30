import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/desktop.dart';
import 'package:login/registration.dart';
import 'package:login/login.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(home:registerPage());
    return MaterialApp(home:dashboard(),debugShowCheckedModeBanner: false,);
    //return MaterialApp(home:login());
  }
}
