import 'package:flutter/material.dart';

import '../models/models.dart';
import '../theme.dart';
import 'bullet_line.dart';

const kittenUrl =
    'https://www.petage.com/wp-content/uploads/2019/09/Depositphotos_74974941_xl-2015-e1569443284386.jpg';

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
            Image.network(
              kittenUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const Center(child: CircularProgressIndicator());
              },
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
            ...[
              'Username: ${user.username}',
              'Email: ${user.email}',
              'Address: ${user.address}',
              'Phone: ${user.phone}',
              'Website: ${user.website}',
            ].map(
              (line) => BulletLine(
                text: Text(
                  line,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
