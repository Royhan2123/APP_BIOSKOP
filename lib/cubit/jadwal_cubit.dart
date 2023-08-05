import 'package:flutter_bloc/flutter_bloc.dart';

class JadwalCubit extends Cubit<List<String>> {
  JadwalCubit() : super([]);

  void selecJadwal(String id) {
    // ignore: avoid_print
    print("Sebelum di ubah $state");
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
    // ignore: avoid_print
    print("Perubahan si $state");
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    // ignore: avoid_print
    print('indedx : $index');
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
