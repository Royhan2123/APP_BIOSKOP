import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String desc;
  final String name;
  final double rating;
  final int price;

  const GambarModels({
    required this.id,
    this.imageUrl = "",
    this.desc = "",
    this.rating = 0.0,
    this.price = 0,
    this.name = "",
  });

  factory GambarModels.fromJson(String id, Map<String, dynamic> json) =>
      GambarModels(
        id: id,
        imageUrl: json["imageUrl"].toString(),
        desc: json["desc"],
        rating: json["rating"].toDouble(),
        name: json["name"],
        price: json["price"],
      );

      @override
  List<Object?> get props => [id,name,imageUrl,price,rating,desc];
}
