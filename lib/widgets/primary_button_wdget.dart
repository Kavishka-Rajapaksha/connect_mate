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
  final bool isOutlined; // New parameter for outlined style
  final Widget? googleIcon;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height = 59,
    this.backgroundColor = const Color(0xFF306AE0),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 5,
    this.spacing = 8,
    this.isGoogle = false,
    this.isOutlined = false, // Default to filled button
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
          color:
              isOutlined
                  ? Colors.transparent
                  : (isGoogle ? Colors.white : backgroundColor),
          shape: RoundedRectangleBorder(
            side:
                isOutlined
                    ? BorderSide(
                      width: 1,
                      color: const Color(0xFF306AE0),
                    ) // Blue border for outlined
                    : (isGoogle
                        ? BorderSide(width: 1, color: const Color(0xFFEFF0F6))
                        : BorderSide.none),
            borderRadius: BorderRadius.circular(
              borderRadius,
            ), // Simplified - using the borderRadius property directly
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              MainAxisAlignment.center, // Ensure center alignment
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isGoogle) ...[
              // Fixed spacing to properly position the Google icon
              const SizedBox(width: 8),
              Container(
                width: 18,
                height: 18,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(), // Add const here
                child: googleIcon ?? const Stack(), // Add const here
              ),
              const SizedBox(width: 10),
            ],

            // Remove Expanded to allow natural sizing of text
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isOutlined
                        ? const Color(0xFF306AE0)
                        : (isGoogle ? const Color(0xFF252525) : textColor),
                fontSize: isGoogle ? 14 : fontSize,
                fontFamily: 'Helvetica',
                fontWeight: fontWeight,
                height: isGoogle ? 1.40 : 1.50,
                letterSpacing: isGoogle ? -0.14 : 0,
              ),
            ),

            if (isGoogle)
              // Add equal spacing at the end to balance the layout
              const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
