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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(gambar.imageArtis),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      gambar.namaArtis,
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(gambar.imageArtis1),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      gambar.namaArtis1,
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(gambar.imageArtis2),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      gambar.namaArtis2,
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(gambar.imageArtis3),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      gambar.namaArtis3,
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(gambar.imageArtis4),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      gambar.namaArtis4,
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
