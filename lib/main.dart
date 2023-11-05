import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/users/users_page.dart';
import 'repositories/repositories.dart';
import 'rest_client.dart';
import 'theme.dart';

void main() {
  final restClient = RestClient(Dio());

  final usersRepository = UsersRepository(restClient: restClient);
  final photosRepository = PhotosRepository(restClient: restClient);

  runApp(
    EclipseTestApp(
      usersRepository: usersRepository,
      photosRepository: photosRepository,
    ),
  );
}

class EclipseTestApp extends StatelessWidget {
  final AbstractUsersRepository usersRepository;
  final AbstractPhotosRepository photosRepository;

  const EclipseTestApp({
    Key? key,
    required this.usersRepository,
    required this.photosRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eclipse test',
      theme: AppTheme.lightTheme(),
      home: Material(
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: usersRepository),
            RepositoryProvider.value(value: photosRepository),
          ],
          child: const UsersPage(),
        ),
      ),
    );
  }
}
