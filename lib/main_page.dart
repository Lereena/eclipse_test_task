import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/users/abstract_users_repository.dart';
import 'users_bloc.dart';
import 'widgets/user_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(context.read<AbstractUsersRepository>())..add(UsersLoad()),
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UsersShowing) {
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: UserCard(user: state.openedUser),
                ),
                const Expanded(child: _CardsSwitcher()),
              ],
            );
          }

          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}

class _CardsSwitcher extends StatelessWidget {
  const _CardsSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          iconSize: 64,
          onPressed: () => context.read<UsersBloc>().add(UsersGetPrevious()),
          icon: const Icon(Icons.arrow_back),
        ),
        IconButton(
          iconSize: 64,
          onPressed: () => context.read<UsersBloc>().add(UsersGetNext()),
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
