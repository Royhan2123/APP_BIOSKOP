import 'package:apk_bioskop/card_nonton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/gambar_cubit.dart';
import '../models/gambar_models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    gambarCarouel();
    context.read<GambarCubit>().fetchGambar();
    super.initState();
  }

  List<String> gambar = [];

  gambarCarouel() async {
    var firestoreinstance = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await firestoreinstance.collection("gambar_nonton").get();

    setState(() {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        gambar.add(
          querySnapshot.docs[i]["imageUrl"],
        );
      }
    });
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    Widget name() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 15, top: 20),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 75, 45, 122),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 147, 82, 183),
                          blurRadius: 25,
                          offset: Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello ${state.user.name}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "Welcome to M-Tix",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Text(
                                  "what movie would you\nlike to watch today?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 75,
                                height: 75,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/camera.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1.5, color: Colors.white)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/pay2.png"))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                NumberFormat.currency(
                                        locale: "id",
                                        symbol: "IDR ",
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 15)),
                            const SizedBox(
                              width: 25,
                            ),
                            const Center(
                              child: Text(
                                "|",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/transfer.png"))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Transfer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget gambarBioskop() {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 15, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Akan Datang",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      "Semua",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.deepPurple),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                height: 300,
                margin: const EdgeInsets.only(top: 20, left: 5),
                child: CarouselSlider(
                    items: gambar.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(item), fit: BoxFit.fill),
                            border: Border.all(width: 3, color: Colors.white)),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        reverse: true,
                        aspectRatio: 3.0))),
          ],
        ),
      );
    }

    Widget nontonOnline(List<GambarModels> gambar) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 15, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sedang Tayang",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      "Semua",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.deepPurple),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: gambar.map((GambarModels gambar) {
                  return CardNonton(gambar);
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<GambarCubit, GambarState>(
          listener: (context, state) {
            if (state is GambarFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is GambarSucces) {
              return ListView(
                children: [
                  name(),
                  gambarBioskop(),
                  nontonOnline(state.gambar),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
