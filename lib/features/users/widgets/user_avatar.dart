import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';
import '../../user_photos/user_photos_dialog.dart';
import '../bloc/user_avatar/user_avatar_cubit.dart';

class UserAvatar extends StatelessWidget {
  final int userId;

  const UserAvatar({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAvatarCubit(
        userId: userId,
        albumsRepository: context.read<AbstractAlbumsRepository>(),
        photosRepository: context.read<AbstractPhotosRepository>(),
      ),
      child: _UserAvatarView(userId: userId),
    );
  }
}

class _UserAvatarView extends StatelessWidget {
  final int userId;

  const _UserAvatarView({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => UserPhotosDialog.show(context: context, userId: userId),
        child: BlocBuilder<UserAvatarCubit, UserAvatarState>(
          builder: (context, state) {
            if (state is UserAvatarLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserAvatarLoadedNoPhoto) {
              return const Icon(Icons.person, size: 64);
            }

            if (state is UserAvatarLoaded) {
              return Image.network(
                state.photo.url,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return const Center(child: CircularProgressIndicator());
                },
              );
            }

            return const Center(child: Text('Error'));
          },
        ),
      ),
    );
  }
}
