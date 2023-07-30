import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNonton extends StatelessWidget {
  final GambarModels gambar;
  const CardNonton(this.gambar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 220,
          margin: const EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(gambar.imageUrl), fit: BoxFit.fill)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gambar.name,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
