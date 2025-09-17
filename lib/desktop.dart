  import 'package:flutter/material.dart';
  import 'package:login/login.dart';
  import 'package:login/user_list.dart';
  import 'package:login/AboutUsPage.dart';

  class dashboard extends StatelessWidget {
    const dashboard({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(12),
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                dashboardButton(context, img: "assets/image/pen.png", title: "Add user", click: login()),
                dashboardButton(context, img: "assets/image/customer.png", title: "User List",click: UserList()),
                dashboardButton(context, img: "assets/image/favourite.png", title: "Favourite User",click:UserList(fromFav: true)),
                dashboardButton(context, img: "assets/image/profile-user.png", title: "About us",click: AboutUsPage()),
              ],
            ),
          ),
        ),
      );
    }

    Widget dashboardButton(context, {required img, required title, click}) {
      return Card(
        elevation: 4,
        color: Colors.white,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
            if (click != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => click),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, height: 60, width: 60, color: Colors.red),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      );
    }
  }
