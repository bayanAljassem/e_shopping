import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomtabbar.dart';
import 'homescreen.dart';
import 'log_in_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userLoggedIn = prefs.getInt('loggedin') ?? 1;
    if (userLoggedIn==1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => BottomTabBar()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
