import 'package:connect_mate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryTextField extends StatefulWidget {
  /// The placeholder / hint text inside the field
  final String placeholder;

  /// Whether this is a password field (toggles obscureText + eye icon)
  final bool isPassword;

  /// Width of the field (defaults to full width of parent)
  final double? width;

  /// Height of the field (defaults to 52)
  final double height;

  /// Optional controller
  final TextEditingController? controller;

  /// Optional onChanged callback
  final ValueChanged<String>? onChanged;

  const PrimaryTextField({
    Key? key,
    required this.placeholder,
    this.isPassword = false,
    this.width,
    this.height = 52.0,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            color: AppColors.mailGray[400], // slightly darker for readability
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.mailGray[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.mailGray[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.azureRadiance[500]!),
          ),
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    padding: const EdgeInsets.only(right: 16),
                    icon: Icon(
                      // Use standard Material icons for better visibility
                      _obscureText
                          ? Icons
                              .visibility_off_outlined // Show "hidden" icon when text is hidden
                          : Icons
                              .visibility_outlined, // Show "visible" icon when text is shown
                      color: const Color(
                        0xFFD1D1D1,
                      ), // Use the specified gray color
                      size: 24,
                    ),
                    onPressed: _toggleObscure,
                  )
                  : null,
        ),
      ),
    );
  }
}
