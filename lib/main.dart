import 'package:flutter/material.dart';

import 'main_page.dart';
import 'theme.dart';

void main() {
  runApp(const EclipseTestApp());
}

class EclipseTestApp extends StatelessWidget {
  const EclipseTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eclipse test',
      theme: AppTheme.lightTheme(),
      home: const Material(child: MainPage()),
    );
  }
}
