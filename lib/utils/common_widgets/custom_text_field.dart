import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.height,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.onSuffixIconPressed, // Callback for press event
    this.minLines = 1, // Default minimum lines
    this.maxLines = 5, // Default maximum lines
  });

  final double? height;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final int minLines;
  final int maxLines;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixIconPressed,
                  child: suffixIcon,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
