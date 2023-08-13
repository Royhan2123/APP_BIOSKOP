import 'dart:async';
import 'package:apk_bioskop/cubit/transaksi_cubit.dart';
import 'package:apk_bioskop/cubit/waktu_cubit.dart';
import 'package:apk_bioskop/models/transaksi_models.dart';
import 'package:apk_bioskop/succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Transaksi extends StatefulWidget {
  final TransaksiModels transaksi;
  const Transaksi({required this.transaksi, super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  int minutes = 5;
  int seconds = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (minutes == 0 && seconds == 0) {
          _timer.cancel();
          showTimeUpDialog(); // Tampilkan AlertDialog
        } else if (seconds == 0) {
          minutes--;
          seconds = 59;
        } else {
          seconds--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  void showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Waktu Habis'),
          content: const Text('Maaf, waktu pembayaran Anda telah habis.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget headher() {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.0)]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 30),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(widget.transaksi.gambar.imageUrl),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.transaksi.gambar.namaNonton,
                    style: GoogleFonts.alice(fontSize: 20, color: Colors.brown),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.transaksi.gambar.name,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 212, 211, 211)),
                    child: Center(
                      child: Text(
                        widget.transaksi.gambar.ratingUsia,
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 11),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.transaksi.gambar.namaTempat},',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.transaksi.gambar.studio,
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        ' ${widget.transaksi.gambar.hari},',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.transaksi.gambar.tanggal},',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BlocBuilder<WaktuCubit, int>(
                        builder: (context, state) {
                          String selectedTime = state == 0
                              ? widget.transaksi.gambar.waktu
                              : state == 1
                                  ? widget.transaksi.gambar.waktu1
                                  : state == 2
                                      ? widget.transaksi.gambar.waktu2
                                      : state == 3
                                          ? widget.transaksi.gambar.waktu3
                                          : state == 4
                                              ? widget.transaksi.gambar.waktu4
                                              : state == 5
                                                  ? widget
                                                      .transaksi.gambar.waktu5
                                                  : state == 6
                                                      ? widget.transaksi.gambar
                                                          .waktu6
                                                      : widget.transaksi.gambar
                                                          .waktu7;
                          return Text(
                            selectedTime,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget namaOder() {
      return Container(
        margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Nama Order : ',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 203, 200, 200),
                      fontSize: 13,
                    )),
                const SizedBox(
                  width: 5,
                ),
                Text(widget.transaksi.gambar.namaOrder,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 203, 200, 200),
                      fontSize: 13,
                    )),
              ],
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color.fromARGB(255, 211, 210, 210)),
            ),
          ],
        ),
      );
    }

    Widget detail() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail Transaksi",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pembelian",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${widget.transaksi.pembelian} TIKET",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "No Kursi",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.transaksi.noTicket,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga Kursi",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: "id",
                                    symbol: "Rp",
                                    decimalDigits: 0)
                                .format(widget.transaksi.hargaKursi),
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "x ${widget.transaksi.pembelian}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Biaya Langganan",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: "id",
                                    symbol: "Rp",
                                    decimalDigits: 0)
                                .format(widget.transaksi.biayaLayanan),
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "x ${widget.transaksi.pembelian}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 20),
              height: 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color.fromARGB(255, 211, 210, 210)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Promo & Voucher",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.local_movies,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Jika Anda memiliki voucher M-Tix, Anda mungkin\nbisa menggunakanya di halaman pembayaran\nsetelah halama ini. (S&K berlaku)",
                        style: TextStyle(fontSize: 11.5, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 211, 210, 210)),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selesaikan Pemabayaran Dalam : ",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 11),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${formatTime(minutes)}:${formatTime(seconds)}',
                    style: GoogleFonts.poppins(color: Colors.red, fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pembelian ticket tidak dapat dibatalkan dan diubah",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "**",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        "Umur 2 tahun ke atas diwajibkan membeli ticket",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(
                        width: 1,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget bayar() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 211, 210, 210)),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "TOTAL BAYAR",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: "id", symbol: "Rp", decimalDigits: 0)
                          .format(widget.transaksi.hargaKursi +
                              widget.transaksi.biayaLayanan),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<TransaksiCubit, TransaksiState>(
              listener: (context, state) {
                if (state is TransaksiSucces) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Succes(),
                      ),
                      (route) => false);
                } else if (state is TransaksiFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red, content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is TransaksiLoading) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
              }
                return InkWell(
                  onTap: () {
                    context.read<TransaksiCubit>().dataTransaksi(widget.transaksi);
                  },
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 25, 2, 63)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BAYAR SEKARANG",
                          style: TextStyle(color: Colors.yellow, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              )),
          title: const Text(
            "Ringkasan Order",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [headher(), namaOder(), detail(), bayar()],
        ),
      ),
    );
  }
}
