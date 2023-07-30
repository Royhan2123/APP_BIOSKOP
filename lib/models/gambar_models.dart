import 'package:equatable/equatable.dart';

class GambarModels extends Equatable {
  final String id;
  final String imageUrl;
  final String desc;
  final String name;

  const GambarModels({
    required this.id,
    this.imageUrl = "",
    this.desc = "",
    this.name = "",
  });

  factory GambarModels.fromJson(String id, Map<String, dynamic> json) =>
      GambarModels(
        id: id,
        imageUrl: json["imageUrl"].toString(),
        desc: json["desc"].toString(),
        name: json["name"].toString(),
      );

      @override
  List<Object?> get props => [id,name,imageUrl,desc];
}
