import '../../models/models.dart';

abstract class AbstractPhotosRepository {
  Future<List<Photo>> loadPhotos(int albumId);
}
