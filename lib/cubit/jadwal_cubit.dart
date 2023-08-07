import 'package:flutter_bloc/flutter_bloc.dart';

class JadwalCubit extends Cubit<List<String>> {
  JadwalCubit() : super([]);

  void selectId(String id) {
    //ignore: avoid_print
    print("Sebelum di ubah : $state");
    if (!isSelectId(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
    //ignore: avoid_print
    print("setelah di ubah $state");
  }

  bool isSelectId(String id) {
    int index = state.indexOf(id);

    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
