import 'package:flutter/material.dart';
import 'package:testapp/Theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Sign In Success',
          style: Apptheme.themeData.textTheme.headline1,
        ),
      ),
    );
  }
}
