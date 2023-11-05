import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'models/models.dart';
import 'repositories/users/abstract_users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final AbstractUsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(UsersInitialState()) {
    on<UsersLoad>(_onUsersLoad);
    on<UsersGetPrevious>(_onUsersGetPrevious);
    on<UsersGetNext>(_onUsersGetNext);
  }

  int _openedUserIndex = 0;

  FutureOr<void> _onUsersLoad(UsersLoad event, Emitter<UsersState> emit) async {
    emit(UsersLoading());

    try {
      final users = await usersRepository.loadUsers();

      if (users.isEmpty) {
        emit(UsersError());
        return;
      }

      emit(UsersShowing(openedUser: users.first));
      _openedUserIndex = 0;
    } on Exception {
      emit(UsersError());
    }
  }

  FutureOr<void> _onUsersGetPrevious(
    UsersGetPrevious event,
    Emitter<UsersState> emit,
  ) {
    final user = usersRepository.getUser(_openedUserIndex - 1);
    _openedUserIndex--;

    emit(UsersShowing(openedUser: user!));
  }

  FutureOr<void> _onUsersGetNext(
    UsersGetNext event,
    Emitter<UsersState> emit,
  ) {
    final user = usersRepository.getUser(_openedUserIndex + 1);
    _openedUserIndex++;

    emit(UsersShowing(openedUser: user!));
  }
}