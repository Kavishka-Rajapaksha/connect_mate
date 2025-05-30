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
  final double spacing;
  final bool isGoogle;
  final Widget? googleIcon;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height = 54,
    this.backgroundColor = const Color(0xFF306AE0),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 4,
    this.spacing = 8,
    this.isGoogle = false,
    this.googleIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: isGoogle ? 48 : height,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isGoogle ? 10 : 12,
        ),
        clipBehavior: isGoogle ? Clip.antiAlias : Clip.none,
        decoration: ShapeDecoration(
          color: isGoogle ? Colors.white : backgroundColor,
          shape: RoundedRectangleBorder(
            side:
                isGoogle
                    ? BorderSide(width: 1, color: const Color(0xFFEFF0F6))
                    : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isGoogle) ...[
              Container(
                width: 18,
                height: 18,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: googleIcon ?? Stack(),
              ),
              SizedBox(width: 10), // Fixed 10px spacing for Google buttons
            ] else
              SizedBox(width: spacing / 2),

            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isGoogle ? const Color(0xFF252525) : textColor,
                  fontSize: isGoogle ? 14 : fontSize,
                  fontFamily: 'Helvetica',
                  fontWeight: fontWeight,
                  height: isGoogle ? 1.40 : 1.50,
                  letterSpacing: isGoogle ? -0.14 : 0,
                ),
              ),
            ),

            SizedBox(width: isGoogle ? 0 : spacing / 2),
          ],
        ),
      ),
    );
  }
}
