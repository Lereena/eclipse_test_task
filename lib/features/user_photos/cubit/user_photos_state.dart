part of 'user_photos_cubit.dart';

@immutable
class UserPhotosState {}

class UserPhotosLoading extends UserPhotosState {}

class UserPhotosLoaded extends UserPhotosState {
  final List<Photo> photos;

  UserPhotosLoaded(this.photos);
}

class UserPhotosLoadedNoPhotos extends UserPhotosState {}

class UserPhotosError extends UserPhotosState {}
