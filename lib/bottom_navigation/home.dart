import 'package:apk_bioskop/cubit/auth_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    fetchCarouelImages();
    super.initState();
  }
  List<String> gambar = [];

  fetchCarouelImages() async {
    var firestoreinstance = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await firestoreinstance.collection("gambar").get();

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
    Widget header() {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 2, 63),
        title: SizedBox(
          width: 250,
          height: 40,
          child: TextField(
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              filled: true,
              hoverColor: Colors.white,
              alignLabelWithHint: true,
              fillColor: const Color.fromARGB(255, 49, 15, 105),
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20)),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: Colors.grey,
              ),
              hintText: "Cari di M-tix",
              hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget name() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 15, top: 20),
              child: Row(
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
                          backgroundColor:
                              const Color.fromARGB(255, 188, 188, 188),
                          child: Container(
                            width: 33,
                            height: 33,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/camera.png"))),
                          ),
                        )),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget content() {
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
            Container(
        height: 350,
        margin: const EdgeInsets.only(top: 20),
        child: CarouselSlider(
            items: gambar.map((item) {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(item), fit: BoxFit.cover),
                    border: Border.all(width: 10, color: Colors.white)),
              );
            }).toList(),
            options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                reverse: true,
                aspectRatio: 3.0)))
  
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body:ListView(
                children: [header(), name(), content()],
              ));
  }
}
