import 'package:equatable/equatable.dart';
import 'gambar_models.dart';

class TransaksiModels extends Equatable {
  final GambarModels gambar;
  final int pembelian;
  final String noTicket;
  final int hargaKursi;
  final int biayaLayanan;

  const TransaksiModels({
    required this.gambar,
    this.pembelian = 0,
    this.noTicket = "",
    this.hargaKursi = 0,
    this.biayaLayanan = 0,
  });

  @override
  List<Object?> get props => [pembelian, noTicket, hargaKursi, biayaLayanan];
}
