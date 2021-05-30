import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:si_covid/pages/home_page.dart';
import 'package:si_covid/pages/provinsi_page.dart';
import 'package:si_covid/pages/rumahsakit_page.dart';
import 'package:si_covid/pages/tips_page.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Pages extends StatefulWidget {
  int currentPage;
  Pages(this.currentPage);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List body = [
    HomePage(),
    ProvinsiPage(),
    TipsPage(),
    RumahSakitPage(),
  ];

  // int currentPage = 0;

  void onTapped(int index) {
    setState(() {
      widget.currentPage = index;
    });
    print(widget.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body[widget.currentPage],
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        shadowColor: Colors.black26,
        elevation: 8,
        padding: EdgeInsets.all(12),
        behaviour: SnakeBarBehaviour.floating,
        snakeViewColor: Colors.white,
        selectedItemColor: Color(0xFF4A663D),
        unselectedItemColor: Color(0xFF4A663D),
        backgroundColor: Color(0xFF93D773),
        onTap: onTapped,
        currentIndex: widget.currentPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: 'Provinsi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.clean_hands_outlined), label: 'Tips'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined), label: 'Rumah Sakit'),
        ],
      ),
    );
  }
}
