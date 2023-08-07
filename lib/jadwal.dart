import 'package:apk_bioskop/card_jadwal.dart';
import 'package:apk_bioskop/cubit/waktu_cubit.dart';
import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:apk_bioskop/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Jadwal extends StatefulWidget {
  final GambarModels gambar;
  const Jadwal(this.gambar, {super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    Widget headher() {
      return Column(
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
            width: double.infinity,
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
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget content() {
      return Card(
        margin: const EdgeInsets.only(top: 160),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 208, 208, 208),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.star,
                                size: 25,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.gambar.namaTempat,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          width: 35,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 238, 172, 5),
                                Color.fromARGB(255, 255, 107, 1),
                                Color.fromARGB(255, 240, 152, 28)
                              ])),
                          child: Center(
                            child: Text(
                              "XXI",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            widget.gambar.km,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.gambar.jalan,
                            style: const TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "2D",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: "id",
                                    symbol: "Rp",
                                    decimalDigits: 0)
                                .format(widget.gambar.price),
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    BlocBuilder<WaktuCubit, List<TimeContainerState>>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 0; i < 4; i++)
                              InkWell(
                                onTap: () {
                                  context.read<WaktuCubit>().setTimeClicked(i);
                                },
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: state[i] ==
                                            TimeContainerState.clicked
                                        ? const Color.fromARGB(255, 25, 2, 63)
                                        : const Color.fromARGB(
                                            255, 208, 208, 208),
                                  ),
                                  child: Center(
                                    child: Text(
                                      i == 0
                                          ? widget.gambar.waktu
                                          : i == 1
                                              ? widget.gambar.waktu2
                                              : i == 2
                                                  ? widget.gambar.waktu3
                                                  : widget.gambar.waktu4,
                                      style: TextStyle(
                                        color: state[i] ==
                                                TimeContainerState.clicked
                                            ? Colors.yellow
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<WaktuCubit, List<TimeContainerState>>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 4; i < 8; i++)
                              InkWell(
                                onTap: () {
                                  context.read<WaktuCubit>().setTimeClicked(i);
                                },
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: state[i] ==
                                            TimeContainerState.clicked
                                        ? const Color.fromARGB(255, 25, 2, 63)
                                        : const Color.fromARGB(
                                            255, 208, 208, 208),
                                  ),
                                  child: Center(
                                    child: Text(
                                      i == 3
                                          ? widget.gambar.waktu4
                                          : i == 4
                                              ? widget.gambar.waktu5
                                              : i == 5
                                                  ? widget.gambar.waktu6
                                                  : widget.gambar.waktu7,
                                      style: TextStyle(
                                        color: state[i] ==
                                                TimeContainerState.clicked
                                            ? Colors.yellow
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              /**
               * PEMBATAS
               */
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                height: 7,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 207, 207)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 208, 208, 208),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.star,
                                size: 25,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.gambar.namaTempat1,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          width: 35,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 238, 172, 5),
                                Color.fromARGB(255, 255, 107, 1),
                                Color.fromARGB(255, 240, 152, 28)
                              ])),
                          child: Center(
                            child: Text(
                              "XXI",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            widget.gambar.km1,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.gambar.jalan1,
                            style: const TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "2D",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: "id",
                                    symbol: "Rp",
                                    decimalDigits: 0)
                                .format(widget.gambar.price1),
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    BlocBuilder<WaktuCubit, List<TimeContainerState>>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 0; i < 4; i++)
                              InkWell(
                                onTap: () {
                                  context.read<WaktuCubit>().setTimeClicked(i);
                                },
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: state[i] ==
                                            TimeContainerState.clicked
                                        ? const Color.fromARGB(255, 25, 2, 63)
                                        : const Color.fromARGB(
                                            255, 208, 208, 208),
                                  ),
                                  child: Center(
                                    child: Text(
                                      i == 0
                                          ? widget.gambar.waktu
                                          : i == 1
                                              ? widget.gambar.waktu2
                                              : i == 2
                                                  ? widget.gambar.waktu3
                                                  : widget.gambar.waktu4,
                                      style: TextStyle(
                                        color: state[i] ==
                                                TimeContainerState.clicked
                                            ? Colors.yellow
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<WaktuCubit, List<TimeContainerState>>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 4; i < 8; i++)
                              InkWell(
                                onTap: () {
                                  context.read<WaktuCubit>().setTimeClicked(i);
                                },
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: state[i] ==
                                            TimeContainerState.clicked
                                        ? const Color.fromARGB(255, 25, 2, 63)
                                        : const Color.fromARGB(
                                            255, 208, 208, 208),
                                  ),
                                  child: Center(
                                    child: Text(
                                      i == 3
                                          ? widget.gambar.waktu4
                                          : i == 4
                                              ? widget.gambar.waktu5
                                              : i == 5
                                                  ? widget.gambar.waktu6
                                                  : widget.gambar.waktu7,
                                      style: TextStyle(
                                        color: state[i] ==
                                                TimeContainerState.clicked
                                            ? Colors.yellow
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      );
    }

    Widget beliTicket() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<WaktuCubit, List<TimeContainerState>>(
          builder: (context, state) {
            bool anyContainerClicked =
                state.any((state) => state == TimeContainerState.clicked);
            return InkWell(
              onTap: () {
                if (anyContainerClicked) {
                  context.read<WaktuCubit>().setTimeClicked(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pemesanan(),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                color: anyContainerClicked
                    ? const Color.fromARGB(255, 25, 2, 63)
                    : const Color.fromARGB(255, 208, 208, 208),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_movies,
                      size: 25,
                      color: anyContainerClicked ? Colors.yellow : Colors.grey,
                    ),
                    Text(
                      "BELI TIKET",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color:
                              anyContainerClicked ? Colors.yellow : Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          headher(),
          content(),
          beliTicket(),
        ],
      ),
    );
  }
}
