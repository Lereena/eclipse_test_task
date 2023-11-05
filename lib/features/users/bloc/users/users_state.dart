part of 'users_bloc.dart';

@immutable
class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoading extends UsersState {}

class UsersShowing extends UsersState {
  final User openedUser;

  UsersShowing({required this.openedUser});
}

class UsersError extends UsersState {}
