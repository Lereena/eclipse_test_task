part of 'users_bloc.dart';

@immutable
class UsersState {
  final int openedUserIndex;

  const UsersState({required this.openedUserIndex});
}

class UsersInitialState extends UsersState {
  const UsersInitialState() : super(openedUserIndex: 0);
}

class UsersLoading extends UsersState {
  const UsersLoading() : super(openedUserIndex: 0);
}

class UsersShowing extends UsersState {
  final User openedUser;

  const UsersShowing({required this.openedUser, required int openedUserIndex})
      : super(openedUserIndex: openedUserIndex);
}

class UsersError extends UsersState {
  const UsersError({required int openedUserIndex})
      : super(openedUserIndex: openedUserIndex);
}
