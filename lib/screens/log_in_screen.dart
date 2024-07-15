import 'package:e_shoping/colors.dart';
import 'package:e_shoping/screens/homescreen.dart';
import 'package:e_shoping/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/profileprovider.dart';
import 'bottomtabbar.dart';





class LoginScreen extends StatelessWidget {

  TextEditingController _textFieldemailController = TextEditingController();
  TextEditingController _textFieldpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 110,),
              Image.asset('assets/images/freed.png',color: Colors.pink.shade200),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person)),
                      controller: _textFieldemailController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffix: Icon(Icons.remove_red_eye)),
                      controller: _textFieldpasswordController,

                    ),Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotScreen()));
                      }, child:Text('Forget Password',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:AppColor.primaycolor
                      ),)),
                    )
                    ,SizedBox(height: 50,),
                    ElevatedButton(
                        onPressed: ()async{
                          SharedPreferences sharedp=await SharedPreferences.getInstance();
                         var p=sharedp.getString('userpassword');
                          var e=sharedp.getString('useremail');
                         print(p);
                          sharedp.setInt('loggedin', 1);
                          Provider.of< ProfileProvider>(context, listen: false).setuser();
                          if(_textFieldpasswordController.text==p &&_textFieldemailController==e)
                       {   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomTabBar()));}
                        },
                        child: Text('Log in',style: TextStyle(fontSize: 18,),),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(55),
                            backgroundColor: AppColor.primaycolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        )),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t you have an acount',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,

                        ),),
                        TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignupScreen()));
                        }, child:Text('Sign Up',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:AppColor.primaycolor,
                        ),))
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
