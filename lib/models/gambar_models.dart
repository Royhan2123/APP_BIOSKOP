import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String imageBintang;
  final String desc;
  final String name;
  final String jalan;
  final String jalan1;
  final String jalan2;
  final String jalan3;
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
  final String namaTempat;
  final String namaTempat1;
  final String namaTempat2;
  final String namaTempat3;
  final String genre;
  final double rating;
  final String ratingUsia;
  final int penonton;
  final int price;
  final int price1;
  final int price2;
  final int price3;
  final String km;
  final String km1;
  final String km2;
  final String km3;
  final String waktu;
  final String waktu1;
  final String waktu2;
  final String waktu3;
  final String waktu4;
  final String waktu5;
  final String waktu6;
  final String waktu7;
  final String sutradara;

  const GambarModels(
      {required this.id,
      this.imageUrl = "",
      this.desc = "",
      this.name = "",
      this.jalan = "",
      this.jalan1 = "",
      this.km = "",
      this.km1 = "",
      this.km2 = "",
      this.km3 = "",
      this.jalan2 = "",
      this.jalan3 = "",
      this.imageArtis = "",
      this.imageArtis1 = "",
      this.imageArtis2 = "",
      this.imageArtis3 = "",
      this.imageArtis4 = "",
      this.penonton = 0,
      this.price = 0,
      this.price1 = 0,
      this.price2 = 0,
      this.price3 = 0,
      this.imageBintang = "",
      this.namaArtis = "",
      this.namaTempat = "",
      this.namaTempat1 = "",
      this.namaTempat2 = "",
      this.namaTempat3 = "",
      this.namaArtis1 = "",
      this.namaArtis2 = "",
      this.namaArtis3 = "",
      this.namaArtis4 = "",
      this.rating = 0.0,
      this.ratingUsia = "",
      this.durasi = "",
      this.genre = "",
      this.waktu = "",
      this.waktu1 = "",
      this.waktu2 = "",
      this.waktu3 = "",
      this.waktu4 = "",
      this.waktu5 = "",
      this.waktu6 = "",
      this.waktu7 = "",
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
        namaTempat: json["namaTempat"].toString(),
        namaTempat1: json["namaTempat1"].toString(),
        namaTempat2: json["namaTempat2"].toString(),
        namaTempat3: json["namaArtis"].toString(),
        namaArtis1: json["namaArtis1"].toString(),
        namaArtis2: json["namaArtis2"].toString(),
        namaArtis3: json["namaArtis3"].toString(),
        namaArtis4: json["namaArtis4"].toString(),
        desc: json["desc"].toString(),
        km: json["km"].toString(),
        km1: json["km1"].toString(),
        km2: json["km2"].toString(),
        km3: json["km3"].toString(),
        waktu: json["waktu"].toString(),
        waktu1: json["waktu1"].toString(),
        waktu2: json["waktu2"].toString(),
        waktu3: json["waktu3"].toString(),
        waktu4: json["waktu4"].toString(),
        waktu5: json["waktu5"].toString(),
        waktu6: json["waktu6"].toString(),
        waktu7: json["waktu7"].toString(),
        name: json["name"].toString(),
        jalan: json["jalan"].toString(),
        jalan1: json["jalan1"].toString(),
        jalan2: json["jalan2"].toString(),
        jalan3: json["jalan3"].toString(),
        durasi: json["durasi"].toString(),
        genre: json["genre"].toString(),
        penonton: json["penonton"],
        price: json["price"],
        price1: json["price1"],
        price2: json["price2"],
        price3: json["price3"],
        rating: json["rating"].toDouble(),
        sutradara: json["sutradara"].toString(),
        ratingUsia: json["ratingUsia"].toString(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        jalan,
        jalan1,
        jalan2,
        jalan3,
        imageUrl,
        penonton,
        desc,
        ratingUsia,
        durasi,
        genre,
        km,
        km1,
        km2,
        km3,
        sutradara,
        rating,
        imageArtis,
        imageArtis1,
        imageArtis2,
        imageArtis3,
        imageArtis4,
        namaTempat,
        namaTempat1,
        namaTempat2,
        namaTempat3,
        namaArtis,
        namaArtis1,
        namaArtis2,
        namaArtis3,
        namaArtis4,
        price,
        price1,
        price2,
        price3,
        waktu,
        waktu1,
        waktu2,
        waktu3,
        waktu4,
        waktu5,
      ];
}
