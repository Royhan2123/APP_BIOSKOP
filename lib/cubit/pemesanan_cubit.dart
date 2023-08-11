import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Color shadowcolor = Colors.transparent;

class PemesananCubit extends Cubit<List<String>> {
  PemesananCubit() : super([]);

  void selectKursi(String id) {
    // ignore: avoid_print
    print("sebelum di klik $state");
    if (!isSelected(id)) {
      if (state.length < 4) {
        state.add(id);
      } else {
        // Tampilkan pesan bahwa sudah mencapai batas maksimal
        // Anda bisa menggunakan SnackBar atau cara lainnya
        // ignore: avoid_print
        print("Anda hanya bisa memilih maksimal 4 kursi");
        return;
      }
    } else {
      state.remove(id);
    }
    emit(List.from(state));
    // ignore: avoid_print
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

  bool klik() {
    return state.isNotEmpty;
  }
  int getSelectedSeatsCount() {
  return state.length;
}
}
