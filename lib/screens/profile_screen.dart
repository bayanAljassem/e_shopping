import 'package:e_shoping/colors.dart';
import 'package:e_shoping/provider/profileprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/profilepicture.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile setting',style: TextStyle(
              fontFamily:'DancingScript',

              fontSize: 25,
            color: AppColor.primaycolor
          ),),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation:0,


          // هنا نستخدم PreferredSize لتحديد حجم الـ AppBar
          flexibleSpace: Container(
              decoration: BoxDecoration(
                // تعريف الـ Gradient هنا
                gradient: LinearGradient(

                  colors: [
                    Color.fromRGBO(157, 131, 160, 0.2),
                    Color.fromRGBO(118, 140, 220, 0.1),
                  ],
                ),
              ))


      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width ,
          decoration:BoxDecoration(
            // تعريف الـ Gradient هنا
            gradient: LinearGradient(

                colors: [
                  Color.fromRGBO(157, 131, 160, 0.2),
                  Color.fromRGBO(118, 140, 220, 0.1),
                ]
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 40),

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft:  Radius.circular(25),
                  bottomRight:  Radius.circular(25),
                  bottomLeft:  Radius.circular(25),
                )
            ),

            width:MediaQuery.of(context).size.width ,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(

                      child: ProfileWidget('assets/images/profile.png')
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,),
                        child: Text('Full Name',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold

                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 10),
                        child: Text('${context.watch<ProfileProvider>().username}',style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),),

                      ),
                      Divider(),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,),
                        child: Text('E-mail',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold

                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 10),
                        child: Text('${context.watch<ProfileProvider>().useremail}',style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),),

                      ),

                      Divider(),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,),
                        child: Text('Phone Number',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold

                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 10),
                        child: Text('${context.watch<ProfileProvider>().usernumber}',style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),),

                      ),
                      Divider(),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,),
                        child: Text('Password',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold

                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 10),
                        child: Text('${context.watch<ProfileProvider>().userpassword}',style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey

                        ),),

                      ),
                      Divider(),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
