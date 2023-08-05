import 'package:flutter_bloc/flutter_bloc.dart';

enum Perubahan { grey, red }

class LoveCubit extends Cubit<Perubahan> {
  LoveCubit() : super(Perubahan.grey);

  void toggleLove() {
    // ignore: avoid_print
    print("perubahan $state");
    if (state == Perubahan.grey) {
      emit(Perubahan.red);
    } else {
      emit(Perubahan.grey);
    }
  }
}
