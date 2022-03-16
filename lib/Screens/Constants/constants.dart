import 'package:flutter/material.dart';

pageRoute(Widget page) {
  return MaterialPageRoute(builder: (context) {
    return page;
  });
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

showSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
