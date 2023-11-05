import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'user_avatar_state.dart';

class UserAvatarCubit extends Cubit<UserAvatarState> {
  final AbstractAlbumsRepository albumsRepository;
  final AbstractPhotosRepository photosRepository;

  final int userId;

  UserAvatarCubit({
    required this.albumsRepository,
    required this.photosRepository,
    required this.userId,
  }) : super(UserAvatarLoading()) {
    _getAvatar();
  }

  Future<void> _getAvatar() async {
    emit(UserAvatarLoading());
    try {
      final albums = await albumsRepository.loadAlbums(userId);

      if (albums.isEmpty) emit(UserAvatarLoadedNoPhoto());

      final photos = await photosRepository.loadPhotos(albums.first.id);

      if (photos.isEmpty) emit(UserAvatarLoadedNoPhoto());

      emit(UserAvatarLoaded(photos.first));
    } on Exception {
      emit(UserAvatarError());
    }
  }
}
