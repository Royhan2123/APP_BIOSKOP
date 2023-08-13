import 'package:apk_bioskop/models/transaksi_models.dart';
import 'package:apk_bioskop/services/transaksi_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  void dataTransaksi(TransaksiModels transaksi) async {
    try {
      emit(TransaksiLoading());
      await TransaksiServices().dataTransaks(transaksi);
      emit(TransaksiSucces(transaksi));
    } catch (e) {
      emit(TransaksiFailed(e.toString()));
    }
  }
}
