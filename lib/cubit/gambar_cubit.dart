import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:apk_bioskop/services/gambar_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'gambar_state.dart';

class GambarCubit extends Cubit<GambarState> {
  GambarCubit() : super(GambarInitial());

  void fetchGambar() async {
    try {
      emit(GambarLoading());
      List<GambarModels> gambar = await GambarServices().fetchGambar();
      emit(GambarSucces(gambar));
    } catch (e) {
      emit(GambarFailed(e.toString()));
    }
  }
}
