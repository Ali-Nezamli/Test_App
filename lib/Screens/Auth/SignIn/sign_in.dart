import 'package:flutter/material.dart';
import 'package:testapp/Screens/Auth/widgets/custom_text_form_field.dart';
import 'package:testapp/Theme/theme.dart';
import 'package:testapp/constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context) * 0.05,
                vertical: screenHeight(context) * 0.1,
              ),
              child: Text(
                'Sign In',
                style: Apptheme.themeData.textTheme.headline1,
              ),
            ),
            CustomTextFormField(
              title: 'Email',
              onChanged: (value) {},
              hint: 'Email',
              validator: (value) {},
            ),
            CustomTextFormField(
              title: 'Password',
              hint: 'Password',
              onChanged: (value) {},
              validator: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
