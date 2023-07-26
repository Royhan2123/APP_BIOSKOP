import 'package:apk_bioskop/bottom_navigation/account.dart';
import 'package:apk_bioskop/bottom_navigation/costum_bottom.dart';
import 'package:apk_bioskop/bottom_navigation/home.dart';
import 'package:apk_bioskop/bottom_navigation/search.dart';
import 'package:apk_bioskop/cubit/bottom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalamanBottom extends StatelessWidget {
  const HalamanBottom({super.key});

  @override
  Widget build(BuildContext context) {
    Widget perpindahan(int currentindex) {
      switch (currentindex) {
        case 0:
          return const Home();
        case 1:
          return const Search();
        case 2:
          return const Account();
        default:
          return const Home();
      }
    }

    Widget bottom() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CostumBottom(imageUrl: "assets/images/home.png", index: 0),
              CostumBottom(imageUrl: "assets/images/search.png", index: 1),
              CostumBottom(imageUrl: "assets/images/setting.png", index: 2),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: BlocBuilder<BottomCubit, int>( 
        builder: (context, currentindex) {
          return Stack(
            children: [perpindahan(currentindex), bottom()],
          );
        },
      ),
    );
  }
}
