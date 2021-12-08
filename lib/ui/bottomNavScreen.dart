import 'package:e_commerce/const/AppColor.dart';
import 'package:e_commerce/ui/BottomNavPage/cart.dart';
import 'package:e_commerce/ui/BottomNavPage/favourite.dart';
import 'package:e_commerce/ui/BottomNavPage/homeScreen.dart';
import 'package:e_commerce/ui/BottomNavPage/profile.dart';
import 'package:flutter/material.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  @override
  final _pages = [Home(), favourite(), cart(), profile()];
  int _currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "E-Commerce",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.deep_orange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            title: Text("Favourite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: _pages[_currentindex],
    );
  }
}
