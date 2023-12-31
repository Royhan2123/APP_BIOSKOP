import 'package:apk_bioskop/cubit/pemesanan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPemesanan extends StatefulWidget {
  final String id;
  final bool isAvalaible;
  final String text;
  const CardPemesanan(
      {required this.text,
      this.isAvalaible = true,
      required this.id,
      super.key});

  @override
  State<CardPemesanan> createState() => _CardPemesananState();
}

class _CardPemesananState extends State<CardPemesanan> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<PemesananCubit>().isSelected(widget.id);
    backgroundColor() {
      if (!widget.isAvalaible) {
        context
            .read<PemesananCubit>()
            .setShadowColor(const Color.fromARGB(255, 141, 139, 139));
        return const Color.fromARGB(255, 208, 208, 208);
      } else {
        if (isSelected) {
          context.read<PemesananCubit>().setShadowColor(Colors.redAccent);
          return Colors.red;
        } else {
          context.read<PemesananCubit>().setShadowColor(Colors.lightGreen);
          return const Color.fromARGB(255, 3, 172, 34);
        }
      }
    }

    return InkWell(
      onTap: () {
        if (widget.isAvalaible) {
          context.read<PemesananCubit>().selectKursi(widget.id);
        }
      },
      child: Container(
        height: 25,
        width: 30,
        margin: const EdgeInsets.only(
          right: 5,
          top: 5,
          left: 5,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor(),
            boxShadow: [
              BoxShadow(
                color: context.read<PemesananCubit>().getShadowColor(),
                blurRadius: 3.0,
              ),
            ]),
        child: Center(
            child: Text(
          "${widget.text} ",
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
