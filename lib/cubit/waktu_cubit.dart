import 'package:flutter_bloc/flutter_bloc.dart';
class WaktuCubit extends Cubit<int> {
  WaktuCubit() : super(-1);

  void setTimeClicked(int index) {
    emit(index);
  }
}
