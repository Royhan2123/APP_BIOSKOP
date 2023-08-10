import 'package:apk_bioskop/cubit/jadwal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/gambar_models.dart';

class CardJadwal extends StatelessWidget {
  final String id;
  final GambarModels gambar;
  final String hari;
  final bool isAvalaible;
  const CardJadwal(this.gambar,
      {required this.hari,
      this.isAvalaible = true,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<JadwalCubit>().isSelectId(id);
    backgroundColor() {
      if (!isAvalaible) {
        return const Color.fromARGB(255, 25, 2, 63);
      } else {
        if (isSelected) {
          return const Color.fromARGB(255, 25, 2, 63);
        } else {
          return const Color.fromARGB(255, 208, 208, 208);
        }
      }
    }

    return InkWell(
      onTap: () {
        context.read<JadwalCubit>().selectId(id);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 90,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.5),
            color: backgroundColor()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gambar.tanggal,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$hari ",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
