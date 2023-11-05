import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page.dart';
import 'repositories/users/abstract_users_repository.dart';
import 'repositories/users/users_repository.dart';
import 'rest_client.dart';
import 'theme.dart';

void main() {
  final restClient = RestClient(Dio());
  final usersRepository = UsersRepository(restClient: restClient);

  runApp(EclipseTestApp(usersRepository: usersRepository));
}

class EclipseTestApp extends StatelessWidget {
  final AbstractUsersRepository usersRepository;

  const EclipseTestApp({Key? key, required this.usersRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eclipse test',
      theme: AppTheme.lightTheme(),
      home: Material(
        child: RepositoryProvider.value(
          value: usersRepository,
          child: const MainPage(),
        ),
      ),
    );
  }
}
