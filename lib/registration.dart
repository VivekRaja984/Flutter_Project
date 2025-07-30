import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  var userNameController=TextEditingController();
  var userAddressContoller=TextEditingController();
  var emailController=TextEditingController();
  var mobileContoller=TextEditingController();
  var dobController=TextEditingController();
  var formkey=GlobalKey<FormState>();

  void _resetForm()
  {
    userNameController.clear();
    userAddressContoller.clear();
    emailController.clear();
    mobileContoller.clear();
    dobController.clear();
    formkey.currentState?.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.blueAccent,
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: userAddressContoller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Enter Address",
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Please Enter Address";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Please Enter Email";
                    }
                    else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
                    {
                      return "Please Enter valid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: mobileContoller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Enter Mobile",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Please Enter Mobile";
                    }
                    else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return "Enter valid 10-digit mobile number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: dobController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Enter DOB",
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Please Enter DOB";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      if(formkey.currentState!.validate())
                      {
                        print("Name = ${userNameController.text}");
                        print("Address = ${userAddressContoller.text}");
                        print("Email = ${emailController.text}");
                        print("MobileNo = ${mobileContoller.text}");
                        print("DOB = ${dobController.text}");
                      }
                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      foregroundColor: Colors.white,
                    ), child: Text("Save")),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(onPressed: _resetForm ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ), child: Text("Reset"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}