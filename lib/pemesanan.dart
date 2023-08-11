import 'package:apk_bioskop/card_pemesanan.dart';
import 'package:apk_bioskop/cubit/pemesanan_cubit.dart';
import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'cubit/waktu_cubit.dart';

class Pemesanan extends StatelessWidget {
  final GambarModels gambar;
  const Pemesanan(this.gambar, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget appbars() {
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gambar.namaTempat,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            BlocBuilder<WaktuCubit, int>(
              builder: (context, state) {
                String selectedTime = state == 0
                    ? gambar.waktu
                    : state == 1
                        ? gambar.waktu1
                        : state == 2
                            ? gambar.waktu2
                            : state == 3
                                ? gambar.waktu3
                                : state == 4
                                    ? gambar.waktu4
                                    : state == 5
                                        ? gambar.waktu5
                                        : state == 6
                                            ? gambar.waktu6
                                            : gambar.waktu7;
                return Row(
                  children: [
                    Text(
                      gambar.tanggal,
                      style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "|",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      selectedTime,
                      style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.access_alarms_rounded,
                size: 25,
                color: Colors.black,
              )),
        ],
      );
    }

    Widget headher() {
      return Container(
        height: 40,
        margin: const EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 213, 212, 212))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 3, 172, 34),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.lightGreen,
                            blurRadius: 3.0,
                          )
                        ]),
                  ),
                  Text(
                    "Tersedia",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 11.5),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 208, 208, 208),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 141, 139, 139),
                              blurRadius: 3.0)
                        ]),
                  ),
                  Text(
                    "Tidak Tersedia",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 11.5),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.redAccent,
                            blurRadius: 3.0,
                          )
                        ]),
                  ),
                  Text(
                    "Pilihanmu",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 11.5),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget layarBioskop() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 140),
          height: 45,
          color: Colors.black87,
          child: Center(
            child: Text(
              "Layar Bioskop Disini",
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
            ),
          ),
        ),
      );
    }

    Widget harga() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<PemesananCubit, List<String>>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOTAL HARGA",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: "id", symbol: "Rp ", decimalDigits: 0)
                              .format(state.length * gambar.price),
                          style: GoogleFonts.poppins(
                              color: Colors.blueGrey, fontSize: 13),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 2,
                        height: 70,
                        color: const Color.fromARGB(255, 210, 206, 206),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TEMPAT DUDUK",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          state.join(', '),
                          style: GoogleFonts.poppins(
                              color: Colors.blueGrey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    Widget order() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(),
          height: 45,
          color: const Color.fromARGB(255, 208, 208, 208),
          child: Center(
            child: Text(
              "Bayar Sekarang",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
          height: 450,
          margin: const EdgeInsets.only(
            top: 100,
            left: 10,
            right: 10,
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 35),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      CardPemesanan(text: "A1", id: "A1"),
                      CardPemesanan(text: "A2", id: "A2"),
                      CardPemesanan(text: "A3", id: "A3"),
                      CardPemesanan(text: "A4", id: "A4"),
                      CardPemesanan(text: "A5", id: "A5"),
                      CardPemesanan(
                        text: "A6",
                        id: "A6",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "A7",
                        id: "A7",
                        isAvalaible: false,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(
                        text: "A8",
                        id: "A8",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "A9", id: "A9"),
                      CardPemesanan(text: "A10", id: "A10"),
                      CardPemesanan(text: "A11", id: "A11"),
                      CardPemesanan(text: "A12", id: "A12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(
                        text: "B1",
                        id: "B1",
                      ),
                      CardPemesanan(text: "B2", id: "B2"),
                      CardPemesanan(
                        text: "B3",
                        id: "B3",
                      ),
                      CardPemesanan(text: "B4", id: "B4"),
                      CardPemesanan(text: "B5", id: "B5"),
                      CardPemesanan(text: "B6", id: "B6"),
                      CardPemesanan(text: "B7", id: "B7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "B8", id: "B8"),
                      CardPemesanan(text: "B9", id: "B9"),
                      CardPemesanan(text: "B10", id: "B10"),
                      CardPemesanan(text: "B11", id: "B11"),
                      CardPemesanan(text: "B12", id: "B12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "C1", id: "C1"),
                      CardPemesanan(text: "C2", id: "C2"),
                      CardPemesanan(
                        text: "C3",
                        id: "C3",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "C4", id: "C4"),
                      CardPemesanan(
                        text: "C5",
                        id: "C5",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "C6", id: "C6"),
                      CardPemesanan(text: "C7", id: "C7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "C8", id: "C8"),
                      CardPemesanan(text: "C9", id: "C9"),
                      CardPemesanan(text: "C10", id: "C10"),
                      CardPemesanan(
                        text: "C11",
                        id: "C11",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "C12", id: "C12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "D1", id: "D1"),
                      CardPemesanan(
                        text: "D2",
                        id: "D2",
                      ),
                      CardPemesanan(text: "D3", id: "D3"),
                      CardPemesanan(text: "D4", id: "D4"),
                      CardPemesanan(text: "D5", id: "D5"),
                      CardPemesanan(text: "D6", id: "D6"),
                      CardPemesanan(
                        text: "D7",
                        id: "D7",
                        isAvalaible: false,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "D8", id: "D8"),
                      CardPemesanan(text: "D9", id: "D9"),
                      CardPemesanan(
                        text: "D10",
                        id: "D10",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "D11",
                        id: "D11",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "D12", id: "D12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "E1", id: "E1"),
                      CardPemesanan(text: "E2", id: "E2"),
                      CardPemesanan(text: "E3", id: "E3"),
                      CardPemesanan(text: "E4", id: "E4"),
                      CardPemesanan(
                        text: "E5",
                        id: "E5",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "E6",
                        id: "E6",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "E7", id: "E7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "E8", id: "E8"),
                      CardPemesanan(text: "E9", id: "E9"),
                      CardPemesanan(text: "E10", id: "E10"),
                      CardPemesanan(
                        text: "E11",
                        id: "E11",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "E12",
                        id: "E12",
                        isAvalaible: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "F1", id: "F1"),
                      CardPemesanan(text: "F2", id: "F2"),
                      CardPemesanan(text: "F3", id: "F3"),
                      CardPemesanan(text: "F4", id: "F4"),
                      CardPemesanan(
                        text: "F5",
                        id: "F5",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "F6",
                        id: "F6",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "F7", id: "F7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "F8", id: "F8"),
                      CardPemesanan(text: "F9", id: "F9"),
                      CardPemesanan(text: "F10", id: "F10"),
                      CardPemesanan(text: "F11", id: "F11"),
                      CardPemesanan(text: "F12", id: "F12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "G1", id: "G1"),
                      CardPemesanan(text: "G2", id: "G2"),
                      CardPemesanan(text: "G3", id: "G3"),
                      CardPemesanan(text: "G4", id: "G4"),
                      CardPemesanan(text: "G5", id: "G5"),
                      CardPemesanan(text: "G6", id: "G6"),
                      CardPemesanan(
                        text: "G7",
                        id: "G7",
                        isAvalaible: false,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "G8", id: "G8"),
                      CardPemesanan(text: "G9", id: "G9"),
                      CardPemesanan(text: "G10", id: "G10"),
                      CardPemesanan(
                        text: "G11",
                        id: "G11",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "G12",
                        id: "G12",
                        isAvalaible: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "H1", id: "H1"),
                      CardPemesanan(text: "H2", id: "H2"),
                      CardPemesanan(text: "H3", id: "H3"),
                      CardPemesanan(text: "H4", id: "H4"),
                      CardPemesanan(
                        text: "H5",
                        id: "H5",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "H6", id: "H6"),
                      CardPemesanan(text: "H7", id: "H7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "H8", id: "H8"),
                      CardPemesanan(text: "H9", id: "H9"),
                      CardPemesanan(text: "H10", id: "H10"),
                      CardPemesanan(text: "H11", id: "H11"),
                      CardPemesanan(text: "H12", id: "H12"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CardPemesanan(text: "J1", id: "J1"),
                      CardPemesanan(text: "J2", id: "J2"),
                      CardPemesanan(text: "J3", id: "J3"),
                      CardPemesanan(
                        text: "J4",
                        id: "J4",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "J5",
                        id: "J5",
                        isAvalaible: false,
                      ),
                      CardPemesanan(
                        text: "J6",
                        id: "J6",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "J7", id: "J7"),
                      SizedBox(
                        width: 35,
                      ),
                      CardPemesanan(text: "J8", id: "J8"),
                      CardPemesanan(text: "J9", id: "J9"),
                      CardPemesanan(text: "J10", id: "J10"),
                      CardPemesanan(
                        text: "J11",
                        id: "J11",
                        isAvalaible: false,
                      ),
                      CardPemesanan(text: "J12", id: "J12"),
                    ],
                  ),
                ],
              ),
            ),
          ));
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            appbars(),
            headher(),
            layarBioskop(),
            harga(),
            order(),
            content(),
          ],
        ),
      ),
    );
  }
}
