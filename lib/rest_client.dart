import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/models.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/users')
  Future<List<User>> getUsers();

  @GET('/albums')
  Future<List<Album>> getAlbums(@Query('userId') int userId);

  @GET('/photos')
  Future<List<Photo>> getPhotos(@Query('albumId') int albumId);
}
