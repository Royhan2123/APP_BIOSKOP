part of 'gambar_nonton_cubit.dart';

abstract class GambarNontonState extends Equatable {
  const GambarNontonState();

  @override
  List<Object> get props => [];
}

class GambarNontonInitial extends GambarNontonState {}

class GambarNontonLoading extends GambarNontonState {}

class GambarNontonSucces extends GambarNontonState {
  final List<GambarModels> gambar;

  const GambarNontonSucces(this.gambar);
  @override
  List<Object> get props => [gambar];
}

class GambarNontonFailed extends GambarNontonState {
  final String error;

  const GambarNontonFailed(this.error);
  @override
  List<Object> get props => [error];
}
