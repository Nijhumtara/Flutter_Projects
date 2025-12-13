import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final controller, keyboardType, hint, errorText, icon;
  const InputBox({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hint,
    required this.errorText,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: keyboardType == TextInputType.visiblePassword ? true : false,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // background color
        errorText: errorText,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
