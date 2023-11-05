import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../theme.dart';
import '../../../widgets/bullet_line.dart';
import 'user_avatar.dart';

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
              child: UserAvatar(key: Key(user.id.toString()), userId: user.id),
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
