import 'package:apk_bioskop/bottom_navigation/account.dart';
import 'package:apk_bioskop/bottom_navigation/home.dart';
import 'package:apk_bioskop/bottom_navigation/search.dart';
import 'package:flutter/material.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  int currentindex = 0;
  final iniisibottom = const [Home(), Search(), Account()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: iniisibottom[currentindex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.deepPurple,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: currentindex,
            onTap: (value) => setState(() {
                  currentindex = value;
                }),
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 25, 2, 63),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "Account"),
            ]),
      ),
    );
  }
}
