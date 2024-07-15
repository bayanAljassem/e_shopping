import 'package:e_shoping/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class SignupScreen extends StatelessWidget {

  TextEditingController _textFieldnameController = TextEditingController();
  TextEditingController _textFieldnumberController = TextEditingController();
  TextEditingController _textFieldemailController = TextEditingController();
  TextEditingController _textFieldpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 1,
              ),
              Image.asset('assets/images/freed.png',
                  color: Colors.pink.shade100),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      controller:_textFieldnameController,
                      decoration: InputDecoration(
                          labelText: 'Enter Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _textFieldemailController,
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _textFieldnumberController,
                      decoration: InputDecoration(
                          labelText: 'Enter Number',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _textFieldpasswordController,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffix: Icon(Icons.remove_red_eye)),
                    ),


                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: ()async {
                          SharedPreferences sharedp=await SharedPreferences.getInstance();
                          sharedp.setString('username', _textFieldnameController.text);
                          sharedp.setString('useremail', _textFieldemailController.text);
                          sharedp.setString('usernumber', _textFieldnumberController.text);
                          sharedp.setString('userpassword', _textFieldpasswordController.text);
                          sharedp.setInt('logedin', 1);

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        child: Text(
                          'Create Acount',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(55),
                            backgroundColor: AppColor.primaycolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)))),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an acount?',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaycolor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
