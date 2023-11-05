import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'models/models.dart';
import 'repositories/repositories.dart';

part 'user_album_photos_state.dart';

class UserAlbumPhotosCubit extends Cubit<UserAlbumPhotosState> {
  final AbstractAlbumsRepository albumsRepository;
  final AbstractPhotosRepository photosRepository;

  final int userId;

  UserAlbumPhotosCubit({
    required this.albumsRepository,
    required this.photosRepository,
    required this.userId,
  }) : super(UserAlbumPhotosLoading()) {
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    emit(UserAlbumPhotosLoading());
    try {
      final albums = await albumsRepository.loadAlbums(userId);

      if (albums.isEmpty) emit(UserAlbumPhotosLoadedNoPhotos());

      final photos = await photosRepository.loadPhotos(albums.first.id);

      if (photos.isEmpty) emit(UserAlbumPhotosLoadedNoPhotos());

      emit(UserAlbumPhotosLoaded(photos));
    } on Exception {
      emit(UserAlbumPhotosError());
    }
  }
}
