import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String imageBintang;
  final String desc;
  final String name;
  final String durasi;
  final String namaArtis;
  final String namaArtis1;
  final String namaArtis2;
  final String namaArtis3;
  final String namaArtis4;
  final String imageArtis;
  final String imageArtis1;
  final String imageArtis2;
  final String imageArtis3;
  final String imageArtis4;
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
      this.imageArtis = "",
      this.imageArtis1 = "",
      this.imageArtis2 = "",
      this.imageArtis3 = "",
      this.imageArtis4 = "",
      this.jumlahPenonton = 180,
      this.imageBintang = "",
      this.namaArtis = "",
      this.namaArtis1 = "",
      this.namaArtis2 = "",
      this.namaArtis3 = "",
      this.namaArtis4 = "",
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
        imageArtis: json["imageArtis"].toString(),
        imageArtis1: json["imageArtis1"].toString(),
        imageArtis2: json["imageArtis2"].toString(),
        imageArtis3: json["imageArtis3"].toString(),
        imageArtis4: json["imageArtis4"].toString(),
        namaArtis: json["namaArtis"].toString(),
        namaArtis1: json["namaArtis1"].toString(),
        namaArtis2: json["namaArtis2"].toString(),
        namaArtis3: json["namaArtis3"].toString(),
        namaArtis4: json["namaArtis4"].toString(),
        desc: json["desc"].toString(),
        name: json["name"].toString(),
        durasi: json["durasi"].toString(),
        genre: json["genre"].toString(),
        jumlahPenonton: json["jumlahPenonton"] != null
            ? json["jumlaPenonton"].toInt()
            : 10850,
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
        rating,
        imageArtis,
        imageArtis1,
        imageArtis2,
        imageArtis3,
        imageArtis4,
        namaArtis,
        namaArtis1,
        namaArtis2,
        namaArtis3,
        namaArtis4,
      ];
}
