import '../../models/models.dart';

abstract class AbstractPhotosRepository {
  Future<List<Photo>> loadUserPhotos(int userId);
}
