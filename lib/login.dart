import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var dobController = TextEditingController();
  var cityController = TextEditingController();
  var genderController = TextEditingController();
  var hobbiesController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> hobbies=[
    {"title":"Cricket","value":false},
    {"title":"football","value":false},
    {"title":"movie","value":false},
  ];
  List<String> city = ["Ahmedabad", "Rajkot", "Jamnagar", "Surat","Bhavnagar","Morbi"];
  String? selectedCity;
  String genderGroupValue="Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(4),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Full Name",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Full Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email Address";
                        }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
                        {
                          return "Please Enter valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Mobile Number",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Mobile Number";
                        }else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return "Enter valid 10-digit mobile number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: dobController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: "Date of Birth",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Date of Birth";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                Container(
                  margin: EdgeInsets.all(18),
                  padding: EdgeInsets.only(left: 8,right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                    child: DropdownButton(
                    dropdownColor: Colors.white,
                    underline: Container(),
                    isExpanded: true,
                    hint: Text("Select City"),
                    items:
                    city.map((e) {
                      return DropdownMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.location_city),
                            Text(e),
                          ],
                        ),
                        value: e,
                      );
                    }).toList(),
                    value: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                      print(value);
                    },
                  ),
                ),


            SizedBox(height: 4.0),
                    RadioListTile(
                      title: Text("Male"),
                        value: "Male", 
                        groupValue: genderGroupValue, 
                        onChanged: (value){
                      genderGroupValue=value!;
                      setState(() {});
                    }),
                    RadioListTile(
                        title: Text("Female"),
                        value: "Female",
                        groupValue: genderGroupValue,
                        onChanged: (value){
                          genderGroupValue=value!;
                          setState(() {});
                        }),
                    SizedBox(height: 4.0),
                    Text("Hobbies:"),
                    Column(
                      children: hobbies.map((item) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(item["title"]),
                          value: item["value"],
                          onChanged: (value) {
                            item["value"] = value;
                            setState(() {

                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_outline)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Confirm Password";
                        } else if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.0),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("Full Name: ${fullNameController.text}");
                            print("Email: ${emailController.text}");
                            print("Mobile: ${mobileController.text}");
                            print("DOB: ${dobController.text}");
                            print("City: ${cityController.text}");
                            print("Gender: ${genderController.text}");
                            print("Hobbies: ${hobbiesController.text}");
                            print("Password: ${passwordController.text}");
                            print("Password: ${confirmPasswordController.text}");
          
                          }
                        },
                        child: Text("Submit")),
                    SizedBox(height:4.0),
                    ElevatedButton(
                        onPressed: (){
                          fullNameController.clear();
                          emailController.clear();
                          mobileController.clear();
                          dobController.clear();
                          cityController.clear();
                          genderController.clear();
                          hobbiesController.clear();
                          passwordController.clear();
                          confirmPasswordController.clear();
                        }, child: Text("Clear"))
                  ],
                ),
              )),
        ));
  }
}
