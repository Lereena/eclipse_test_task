import '../../models/models.dart';
import '../../rest_client.dart';
import 'abstract_photos_repository.dart';

class PhotosRepository implements AbstractPhotosRepository {
  final RestClient restClient;

  PhotosRepository({required this.restClient});

  @override
  Future<List<Photo>> loadPhotos(int albumId) async {
    return restClient.getPhotos(albumId);
  }
}
