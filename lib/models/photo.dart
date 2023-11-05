import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
    this.url,
    this.thumbnailUrl, {
    required this.albumId,
    required this.id,
    required this.title,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
