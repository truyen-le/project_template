import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  const InputTextForm({this.prefixIcon, this.isObscureText});

  final IconData prefixIcon;
  final bool isObscureText;
  @override
  Widget build(BuildContext context) {
    bool _showText = false;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        showCursor: true,
        obscureText: this.isObscureText && !_showText,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(this.prefixIcon),
        ),
      ),
    );
  }
}
