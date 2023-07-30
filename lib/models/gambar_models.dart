import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String desc;
  final String name;
  final String durasi;
  final String genre;
  final String ratingUsia;
  final String sutradara;

  const GambarModels({
    required this.id,
    this.imageUrl = "",
    this.desc = "",
    this.name = "",
    this.ratingUsia = "",
    this.durasi = "",
    this.genre = "",
    this.sutradara = ""
    
  });

  factory GambarModels.fromJson(String id, Map<String, dynamic> json) =>
      GambarModels(
        id: id,
        imageUrl: json["imageUrl"].toString(),
        desc: json["desc"].toString(),
        name: json["name"].toString(),
        durasi: json["durasi"].toString(),
        genre: json["genre"].toString(),
        sutradara: json["sutradara"].toString(),
        ratingUsia: json["name"].toString(),
      );

      @override
  List<Object?> get props => [id,name,imageUrl,desc,ratingUsia,durasi,genre,sutradara];
}
