import 'package:connect_mate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryTextField extends StatefulWidget {
  final String placeholder;
  final bool isPassword;
  final bool isHistory;
  final double? width;
  final double height;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PrimaryTextField({
    Key? key,
    required this.placeholder,
    this.isPassword = false,
    this.isHistory = false,
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
  late TextEditingController _controller;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
    _text = _controller.text;
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  void _onTextChanged(String value) {
    setState(() => _text = value);
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Make sure we use exactly 94px height for history fields
    final double textFieldHeight = widget.isHistory ? 94.0 : widget.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              width: widget.width ?? double.infinity,
              height: textFieldHeight,
              child: TextField(
                controller: _controller,
                onChanged: _onTextChanged,
                obscureText: widget.isPassword ? _obscureText : false,
                maxLength: widget.isHistory ? 40 : null,
                // Add style with 14px font size for history mode
                style: TextStyle(fontSize: widget.isHistory ? 14.0 : null),
                // Remove the character count from showing inside the field
                buildCounter:
                    (
                      context, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) => null,
                maxLines: widget.isHistory ? null : 1,
                minLines: widget.isHistory ? 3 : 1,
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(
                    color:
                        AppColors
                            .mailGray[400], // Slightly darker for readability
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color:
                          widget.isHistory
                              ? Colors.transparent
                              : AppColors.mailGray[200]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color:
                          widget.isHistory
                              ? Colors.transparent
                              : AppColors.mailGray[200]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color:
                          widget.isHistory
                              ? Colors.transparent
                              : AppColors.azureRadiance[500]!,
                    ),
                  ),
                  filled:
                      widget
                          .isHistory, // Add background fill for history note style
                  fillColor:
                      widget.isHistory
                          ? Colors.white
                          : null, // Changed to white instead of grey
                  counterText:
                      widget.isHistory ? null : '', // Hide default counter
                  suffixIcon:
                      widget.isPassword
                          ? IconButton(
                            padding: const EdgeInsets.only(right: 16),
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFFD1D1D1),
                              size: 24,
                            ),
                            onPressed: _toggleObscure,
                          )
                          : widget.isHistory
                          ? Padding(
                            padding: const EdgeInsets.only(
                              right: 50, // Adjusted to accommodate counter
                              top: 8,
                              bottom: 8,
                            ),
                          )
                          : null,
                ),
              ),
            ),
            if (widget.isHistory)
              Positioned(
                bottom: 8,
                right: 8,
                child: Text(
                  '${_text.length.toString().padLeft(2, '0')}/40',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
