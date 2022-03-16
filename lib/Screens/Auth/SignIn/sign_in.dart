import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testapp/Screens/Auth/bloc/signin_bloc.dart';
import 'package:testapp/Screens/Auth/widgets/custom_text_form_field.dart';
import 'package:testapp/Screens/Auth/widgets/validate.dart';
import 'package:testapp/Screens/Constants/assets.dart';
import 'package:testapp/Screens/Home/page/home.dart';
import 'package:testapp/Theme/theme.dart';
import 'package:testapp/Screens/Constants/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = SigninBloc();
  bool loading = false;
  String? userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is Loading) {
          loading = true;
        } else if (state is SigninSuccess) {
          Navigator.pushReplacement(context, pageRoute(const HomePage()));
        } else if (state is SignInUnauthorized) {
          loading = false;
          showSnackBar(context, 'email or password incorrect');
        } else if (state is GoogleSignInSuccess) {
          Navigator.pushReplacement(
              context, pageRoute(HomePage(userData: state.userData)));
        } else if (state is Error) {
          loading = false;
          showSnackBar(context, state.exception);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: SafeArea(
            child: Scaffold(
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                        onChanged: (value) {
                          userEmail = value;
                        },
                        hint: 'Email',
                        validator: (value) {
                          return emailValidate(value!);
                        },
                      ),
                      CustomTextFormField(
                        title: 'Password',
                        hint: 'Password',
                        onChanged: (value) {
                          userPassword = value;
                        },
                        validator: (value) {
                          return passwordValidate(value!);
                        },
                      ),
                      _signInButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _bloc.add(UserSignInEvent(
                              userEmail: userEmail!,
                              userPassword: userPassword!,
                            ));
                          }
                        },
                      ),
                      _googleSignInButton(
                        onPressed: () {
                          _bloc.add(GoolgeSignInEvent());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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

Widget _googleSignInButton({required VoidCallback onPressed}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Image.asset(
      Assets.googleIcon,
      height: 100,
    ),
  );
}
