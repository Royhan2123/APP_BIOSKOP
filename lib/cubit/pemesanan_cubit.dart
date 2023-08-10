import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Color shadowcolor = Colors.transparent; 

class PemesananCubit extends Cubit<List<String>> {
  PemesananCubit() : super([]);

  void selectKursi(String id) {
    //ignore: avoid_print
    print("sebelum di klik $state");
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
    //ignore: avoid_print
    print("setelah di klik $state");
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);

    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void setShadowColor(Color color) {
    shadowcolor = color;
    emit(List.from(state));
  }

  Color getShadowColor() {
    return shadowcolor;
  }
}
