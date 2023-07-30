import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:apk_bioskop/services/gambar_nonton_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'gambar_nonton_state.dart';

class GambarNontonCubit extends Cubit<GambarNontonState> {
  GambarNontonCubit() : super(GambarNontonInitial());

  void fetchGambar() async {
    try {
      emit(GambarNontonLoading());

      List<GambarModels> gambar =
          await GambarNontonServices().fetchGambarNonton();
      emit(GambarNontonSucces(gambar));
    } catch (e) {
      emit(GambarNontonFailed(e.toString()));
    }
  }
}
