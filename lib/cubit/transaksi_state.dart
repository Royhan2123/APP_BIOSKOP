part of 'transaksi_cubit.dart';

sealed class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

final class TransaksiInitial extends TransaksiState {}

final class TransaksiLoading extends TransaksiState {}

final class TransaksiSucces extends TransaksiState {
  final TransaksiModels transaksi;

  const TransaksiSucces(this.transaksi);
  @override
  List<Object> get props => [transaksi];
}

final class TransaksiFailed extends TransaksiState {
  final String error;

  const TransaksiFailed(this.error);
  @override
  List<Object> get props => [error];
}
