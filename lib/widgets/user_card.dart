import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dialogs/user_photos_dialog.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import '../theme.dart';
import '../user_avatar_cubit.dart';
import 'bullet_line.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: _UserAvatar(key: Key(user.id.toString()), userId: user.id),
            ),
            AppTheme.verticalSpacing,
            Text(
              user.name,
              style: theme.textTheme.titleLarge,
            ),
            AppTheme.verticalSpacing,
            Text(
              user.company.name,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium,
            ),
            AppTheme.verticalSpacing,
            _UserDescription(user: user),
          ],
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final int userId;

  const _UserAvatar({Key? key, required this.userId}) : super(key: key);

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

class _UserDescription extends StatelessWidget {
  final User user;

  const _UserDescription({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        'Username: ${user.username}',
        'Email: ${user.email}',
        'Address: ${user.address}',
        'Phone: ${user.phone}',
        'Website: ${user.website}',
      ]
          .map(
            (line) => BulletLine(
              text: Text(
                line,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
    );
  }
}
