part of 'gambar_cubit.dart';

abstract class GambarState extends Equatable {
  const GambarState();

  @override
  List<Object> get props => [];
}

class GambarInitial extends GambarState {}

class GambarLoading extends GambarState {}

class GambarSucces extends GambarState {
  final List<GambarModels> gambar;

  const GambarSucces(this.gambar);

  @override
  List<Object> get props => [gambar];
}

class GambarFailed extends GambarState {
  final String error;

  const GambarFailed(this.error);
  @override
  List<Object> get props => [error];
}
