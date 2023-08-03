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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: gambar.
            ),z
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
