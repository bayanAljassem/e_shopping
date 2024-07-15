import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier{
  String username='';
  String useremail='';
  String usernumber='';
  String userpassword='';
  void setuser()async{
    SharedPreferences sharedp=await  SharedPreferences.getInstance();
    username=sharedp.getString('username')!;
    useremail=sharedp.getString('useremail')!;
    usernumber=sharedp.getString('usernumber')!;
    userpassword=sharedp.getString('userpassword')!;
  }

}