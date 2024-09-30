import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/utils/const/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.oneChild = true,
      this.trailing,
      this.color,
      this.height,
      this.width,
      this.textColor});
  final VoidCallback onPressed;
  final String text;
  final Widget? trailing;
  final bool oneChild;
  final Color? color;
  final double? height;
  final double? width;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: oneChild
                ? Text(
                    text,
                    style: TextStyle(color: textColor ?? whiteColor),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(fontSize: 18, color: whiteColor),
                      ),
                      if (trailing != null) trailing!
                    ],
                  )),
      ),
    );
  }
}
