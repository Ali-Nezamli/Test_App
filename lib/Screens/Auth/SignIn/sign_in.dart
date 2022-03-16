import 'package:flutter/material.dart';
import 'package:testapp/Screens/Auth/widgets/custom_text_form_field.dart';
import 'package:testapp/Screens/Auth/widgets/validate.dart';
import 'package:testapp/Theme/theme.dart';
import 'package:testapp/constants.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
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
                validator: (value) {
                  return requiredField(value!);
                },
              ),
              CustomTextFormField(
                title: 'Password',
                hint: 'Password',
                onChanged: (value) {},
                validator: (value) {
                  return passwordValidate(value!);
                },
              ),
              _signInButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _signInButton({required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Apptheme.primaryColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Sign In',
          style: Apptheme.themeData.textTheme.button,
        ),
      ),
    ),
  );
}
