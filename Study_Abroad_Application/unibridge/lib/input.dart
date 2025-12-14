import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final controller, keyboardType, hint, errorText, icon;
  final bool isPassword;
  final bool? isVisible;
  final VoidCallback? onToggle;

  const InputBox({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hint,
    required this.errorText,
    required this.icon,
    this.isPassword = false,
    this.isVisible,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword ? !(isVisible ?? false) : false,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // background color
        errorText: errorText,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisible == true ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onToggle,
              )
            : null,
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
