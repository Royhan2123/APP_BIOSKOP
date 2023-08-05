import 'package:apk_bioskop/cubit/jadwal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardJadwal extends StatelessWidget {
  final String id;
  final bool isAvalaible;
  final String tanggal;
  final String hari;
  const CardJadwal(
      {required this.hari,
      required this.tanggal,
      this.isAvalaible = true,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<JadwalCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvalaible) {
        return const Color.fromARGB(255, 25, 2, 63);
      } else {
        if (isSelected) {
          return const Color.fromARGB(255, 197, 197, 197);
        } else {
          return const Color.fromARGB(255, 25, 2, 63);
        }
      }
    }

    return InkWell(
      onTap: () {
        context.read<JadwalCubit>().selecJadwal(id);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$tanggal Agu",
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
