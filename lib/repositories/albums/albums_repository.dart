import '../../models/models.dart';
import '../../rest_client.dart';
import '../repositories.dart';

class AlbumsRepository implements AbstractAlbumsRepository {
  final RestClient restClient;

  AlbumsRepository({required this.restClient});

  @override
  Future<List<Album>> loadAlbums(int userId) async {
    return restClient.getAlbums(userId);
  }
}
