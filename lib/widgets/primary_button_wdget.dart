import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width, // Removed default width of 327
    this.height = 54,
    this.backgroundColor = const Color(0xFF306AE0),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity, // Use parent width if not specified
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ), // Updated to 24 horizontal padding
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // Use Expanded instead of SizedBox with fixed width
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontFamily: 'Helvetica',
                  fontWeight: fontWeight,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
