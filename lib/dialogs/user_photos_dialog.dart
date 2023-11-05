import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/repositories.dart';
import '../user_album_photos_cubit.dart';

class UserPhotosDialog extends StatelessWidget {
  const UserPhotosDialog({Key? key}) : super(key: key);

  static Future<void> show({
    required BuildContext context,
    required int userId,
  }) =>
      showDialog(
        context: context,
        builder: (_) => BlocProvider(
          create: (_) => UserAlbumPhotosCubit(
            userId: userId,
            albumsRepository: context.read<AbstractAlbumsRepository>(),
            photosRepository: context.read<AbstractPhotosRepository>(),
          ),
          child: const UserPhotosDialog(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          BlocBuilder<UserAlbumPhotosCubit, UserAlbumPhotosState>(
            builder: (context, state) {
              if (state is UserAlbumPhotosLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is UserAlbumPhotosLoadedNoPhotos) {
                return const Center(child: Text('No photos'));
              }

              if (state is UserAlbumPhotosLoaded) {
                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  children: state.photos
                      .map((e) => Image.network(e.thumbnailUrl))
                      .toList(),
                );
              }

              return const Center(child: Text('Error'));
            },
          ),
          const _BackButton(),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2),
        child: const Icon(Icons.arrow_back),
      ),
      splashRadius: 2,
      color: Colors.white,
      onPressed: () => Navigator.pop(context),
    );
  }
}
