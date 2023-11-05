import '../../models/models.dart';
import '../../rest_client.dart';
import 'abstract_photos_repository.dart';

class PhotosRepository implements AbstractPhotosRepository {
  final RestClient restClient;

  PhotosRepository({required this.restClient});

  @override
  Future<List<Photo>> loadUserPhotos(int userId) async {
    final albums = await restClient.getAlbums(userId);

    if (albums.isEmpty) return [];

    final photos = await restClient.getPhotos(albums.first.id);

    return photos;
  }
}
