import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCubit extends Cubit<int> {
  BottomCubit() : super((0));

  void setPage(int newpage) {
    emit(newpage);
  }
}
