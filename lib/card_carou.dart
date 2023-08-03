import 'package:apk_bioskop/jadwal.dart';
import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:apk_bioskop/sinopsis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCarou extends StatefulWidget {
  final GambarModels gambar;
  const CardCarou(this.gambar, {super.key});

  @override
  State<CardCarou> createState() => _CardCarouState();
}

class _CardCarouState extends State<CardCarou>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget headher() {
      return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.gambar.imageUrl), fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(100),
                color: Colors.black),
            child: const Icon(
              Icons.play_arrow_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget back() {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 40,
          margin: const EdgeInsets.only(top: 10, left: 10),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.black),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(widget.gambar.imageUrl),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.gambar.name,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Genre",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 42,
                            ),
                            Text(
                              widget.gambar.genre,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Durasi",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 42,
                            ),
                            Text(
                              widget.gambar.durasi,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sutradara",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.gambar.sutradara,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Rating Usia",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Container(
                              width: 80,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              child: Center(
                                child: Text(
                                  widget.gambar.ratingUsia,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 203, 200, 200),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.gambar.jumlahPenonton.toString()} ditonton",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                      ),
                    ],
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 234, 232, 232))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Text(
                        widget.gambar.rating.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(widget.gambar.imageBintang))),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        "|",
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 30),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Watchlish",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    dividerColor: Colors.black,
                    controller: controller,
                    tabs: const [
                      Tab(
                        text: "Sinopsis",
                      ),
                      Tab(
                        text: "Jadwal",
                      )
                    ]),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 520,
                child: TabBarView(controller: controller, children: [
                  Sinopsis(widget.gambar),
                  const Jadwal(),
                ]),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          headher(),
          back(),
          content(),
        ],
      )),
    );
  }
}
