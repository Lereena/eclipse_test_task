import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'user_photos_state.dart';

class UserPhotosCubit extends Cubit<UserPhotosState> {
  final AbstractPhotosRepository photosRepository;
  final int userId;

  UserPhotosCubit({
    required this.photosRepository,
    required this.userId,
  }) : super(UserPhotosLoading()) {
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    emit(UserPhotosLoading());
    try {
      final photos = await photosRepository.loadUserPhotos(userId);

      if (photos.isEmpty) emit(UserPhotosLoadedNoPhotos());

      emit(UserPhotosLoaded(photos));
    } on Exception {
      emit(UserPhotosError());
    }
  }
}
