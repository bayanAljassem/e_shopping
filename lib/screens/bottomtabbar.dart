import 'package:e_shoping/screens/homescreen.dart';
import 'package:e_shoping/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedindex=0;

  List<Widget> pages=[
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:pages[selectedindex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor:   Color.fromRGBO(92, 104, 152, 0.8),
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30), label: ''),


          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                size: 30,
              ),
              label: ''),
        ],
        onTap: (i) {
          setState(() {
            selectedindex = i;
          });
        },
      ),
    );
  }
}
