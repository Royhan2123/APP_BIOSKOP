import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:flutter/material.dart';

class CardCarou extends StatefulWidget {
  final GambarModels gambar;
  const CardCarou(this.gambar,{super.key});

  @override
  State<CardCarou> createState() => _CardCarouState();
}

class _CardCarouState extends State<CardCarou> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                )),
          ),
          backgroundColor: Colors.black,
          body: Stack(
            children: [],
          )),
    );
  }
}
