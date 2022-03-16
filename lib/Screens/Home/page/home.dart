import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/Theme/theme.dart';

class HomePage extends StatelessWidget {
  final GoogleSignInAccount? userData;
  const HomePage({Key? key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sign In Success',
              style: Apptheme.themeData.textTheme.headline1,
            ),
          ),
          userData != null
              ? Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(userData!.photoUrl!),
                    ),
                    _text(title: 'Name :', value: userData!.displayName!),
                    _text(title: 'Email :', value: userData!.email),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

Widget _text({required title, required value}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Apptheme.themeData.textTheme.headline2,
        ),
        Text(
          value,
          style: Apptheme.themeData.textTheme.headline2,
        ),
      ],
    ),
  );
}
