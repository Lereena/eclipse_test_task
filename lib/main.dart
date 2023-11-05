import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'rest_client.dart';
import 'theme.dart';
import 'users_page.dart';

void main() {
  final restClient = RestClient(Dio());

  final usersRepository = UsersRepository(restClient: restClient);
  final albumsRepository = AlbumsRepository(restClient: restClient);
  final photosRepository = PhotosRepository(restClient: restClient);

  runApp(
    EclipseTestApp(
      usersRepository: usersRepository,
      albumsRepository: albumsRepository,
      photosRepository: photosRepository,
    ),
  );
}

class EclipseTestApp extends StatelessWidget {
  final AbstractUsersRepository usersRepository;
  final AbstractAlbumsRepository albumsRepository;
  final AbstractPhotosRepository photosRepository;

  const EclipseTestApp({
    Key? key,
    required this.usersRepository,
    required this.albumsRepository,
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
            RepositoryProvider.value(value: albumsRepository),
            RepositoryProvider.value(value: photosRepository),
          ],
          child: const UsersPage(),
        ),
      ),
    );
  }
}
