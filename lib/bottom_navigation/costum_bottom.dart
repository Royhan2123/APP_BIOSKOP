import 'package:apk_bioskop/cubit/bottom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostumBottom extends StatelessWidget {
  const CostumBottom({required this.imageUrl, required this.index, super.key});

  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final currentindex = context.watch<BottomCubit>().state;
    return InkWell(
      onTap: () {
        context.read<BottomCubit>().setPage(index); 
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: 25,
            height: 25,
            color: currentindex == index ? Colors.deepPurple : Colors.grey,
          ),
          Container(
            width: 25,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                18
              ),
                color: currentindex == index ? Colors.deepPurple : Colors.transparent),
          ),
        ],
      ),
    );
  }
}
