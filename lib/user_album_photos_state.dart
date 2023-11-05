part of 'user_album_photos_cubit.dart';

@immutable
class UserAlbumPhotosState {}

class UserAlbumPhotosLoading extends UserAlbumPhotosState {}

class UserAlbumPhotosLoaded extends UserAlbumPhotosState {
  final List<Photo> photos;

  UserAlbumPhotosLoaded(this.photos);
}

class UserAlbumPhotosLoadedNoPhotos extends UserAlbumPhotosState {}

class UserAlbumPhotosError extends UserAlbumPhotosState {}
