import '../../models/models.dart';

abstract class AbstractAlbumsRepository {
  Future<List<Album>> loadAlbums(int userId);
}
