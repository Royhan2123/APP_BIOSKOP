import 'package:apk_bioskop/halamanbottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Succes extends StatefulWidget {
  const Succes({super.key});

  @override
  State<Succes> createState() => _SuccesState();
}

class _SuccesState extends State<Succes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/image_success.png",
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Selamat Menonton 🥳🥳",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 30),
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.deepPurple,
                          shape: const StadiumBorder(),
                          shadowColor: Colors.black),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HalamanBottom(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        "Kembali",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}