import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String imageBintang;
  final String desc;
  final String name;
  final String durasi;
  final String genre;
  final double rating;
  final String ratingUsia;
  final int jumlahPenonton;
  final String sutradara;

  const GambarModels(
      {required this.id,
      this.imageUrl = "",
      this.desc = "",
      this.name = "",
      this.jumlahPenonton = 180,
      this.imageBintang = "",
      this.rating = 0.0,
      this.ratingUsia = "",
      this.durasi = "",
      this.genre = "",
      this.sutradara = ""});

  factory GambarModels.fromJson(String id, Map<String, dynamic> json) =>
      GambarModels(
        id: id,
        imageUrl: json["imageUrl"].toString(),
        imageBintang: json["imageBintang"].toString(),
        desc: json["desc"].toString(),
        name: json["name"].toString(),
        durasi: json["durasi"].toString(),
        genre: json["genre"].toString(),
        jumlahPenonton: json["jumlahPenonton"] != null
            ? json["jumlaPenonton"].toInt()
            : 2086,
        rating: json["rating"].toDouble(),
        sutradara: json["sutradara"].toString(),
        ratingUsia: json["ratingUsia"].toString(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        jumlahPenonton,
        desc,
        ratingUsia,
        durasi,
        genre,
        sutradara,
        rating
      ];
}
