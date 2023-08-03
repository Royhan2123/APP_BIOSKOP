import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardSinopsis extends StatelessWidget {
  final GambarModels gambar;
  const CardSinopsis(this.gambar,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 120,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(gambar.imageArtis), fit: BoxFit.fill)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gambar.namaArtis,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 13),
        ),
      ],
    );
  }
}
