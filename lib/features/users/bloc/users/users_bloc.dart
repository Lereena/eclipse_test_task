import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final AbstractUsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(const UsersInitialState()) {
    on<UsersLoad>(_onUsersLoad);
    on<UsersGetPrevious>(_onUsersGetPrevious);
    on<UsersGetNext>(_onUsersGetNext);
  }

  FutureOr<void> _onUsersLoad(UsersLoad event, Emitter<UsersState> emit) async {
    emit(const UsersLoading());

    try {
      final users = await usersRepository.loadUsers();

      if (users.isEmpty) {
        emit(const UsersError(openedUserIndex: 0));
        return;
      }

      emit(UsersShowing(openedUser: users.first, openedUserIndex: 0));
    } on Exception {
      emit(const UsersError(openedUserIndex: 0));
    }
  }

  FutureOr<void> _onUsersGetPrevious(
    UsersGetPrevious event,
    Emitter<UsersState> emit,
  ) async {
    final newOpenedUserIndex = state.openedUserIndex - 1;

    final user = await usersRepository.getUser(newOpenedUserIndex);

    if (user == null) emit(UsersError(openedUserIndex: newOpenedUserIndex));

    emit(UsersShowing(openedUser: user!, openedUserIndex: newOpenedUserIndex));
  }

  FutureOr<void> _onUsersGetNext(
    UsersGetNext event,
    Emitter<UsersState> emit,
  ) async {
    final newOpenedUserIndex = state.openedUserIndex + 1;

    final user = await usersRepository.getUser(newOpenedUserIndex);

    if (user == null) emit(UsersError(openedUserIndex: newOpenedUserIndex));

    emit(UsersShowing(openedUser: user!, openedUserIndex: newOpenedUserIndex));
  }
}
