import 'package:apk_bioskop/card_jadwal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jadwal extends StatefulWidget {
  final String id;
  const Jadwal({required this.id, super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardJadwal(
                      isAvalaible: false,
                      hari: "Hari ini",
                      tanggal: "07",
                      id: "07"),
                  CardJadwal(hari: "Selasa", tanggal: "08", id: "08"),
                  CardJadwal(hari: "Rabu", tanggal: "09", id: "09"),
                  CardJadwal(hari: "Kamis", tanggal: "10", id: "10"),
                  CardJadwal(hari: "Jumat", tanggal: "11", id: "11"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Bioskop",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 13),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Sortir",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 13),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Studio",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 13),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 231, 231)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
