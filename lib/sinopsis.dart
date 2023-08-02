import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sinopsis extends StatelessWidget {
  final GambarModels gambar;
  const Sinopsis(this.gambar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gambar.desc,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Pemain",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/rizkyNazar.png"),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Rizky Nazar"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
