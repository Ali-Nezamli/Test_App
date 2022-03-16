import 'package:flutter/material.dart';
import 'package:testapp/Theme/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final Function(String) onChanged;
  final String hint;
  final String? Function(String?) validator;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Apptheme.themeData.textTheme.headline2,
          ),
          const SizedBox(height: 10),
          TextFormField(
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Apptheme.secondaryColor)),
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
