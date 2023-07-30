import 'package:apk_bioskop/bottom_navigation/account.dart';
import 'package:apk_bioskop/bottom_navigation/home.dart';
import 'package:apk_bioskop/bottom_navigation/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 25, 2, 63),
          title: SizedBox(
            width: 250,
            height: 40,
            child: TextField(
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                hoverColor: Colors.white,
                alignLabelWithHint: true,
                fillColor: const Color.fromARGB(255, 49, 15, 105),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.grey,
                ),
                hintText: "Cari di M-tix",
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            )
          ],
        ),
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
