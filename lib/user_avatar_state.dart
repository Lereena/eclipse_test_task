part of 'user_avatar_cubit.dart';

@immutable
class UserAvatarState {}

class UserAvatarLoading extends UserAvatarState {}

class UserAvatarLoadedNoPhoto extends UserAvatarState {}

class UserAvatarLoaded extends UserAvatarState {
  final Photo photo;

  UserAvatarLoaded(this.photo);
}

class UserAvatarError extends UserAvatarState {}
