part of 'users_bloc.dart';

@immutable
class UsersEvent {}

class UsersLoad extends UsersEvent {}

class UsersGetNext extends UsersEvent {}

class UsersGetPrevious extends UsersEvent {}
