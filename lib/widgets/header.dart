import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  final String name;
  final VoidCallback? onBackPressed;

  const Header({Key? key, required this.name, this.onBackPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity, // Make sure it takes full width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max, // Ensure row takes full width
        children: [
          // Greeting and name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Evening!',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Back button
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: onBackPressed,
              child: Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFFE7E7E7)),
                    borderRadius: BorderRadius.circular(22.50),
                  ),
                ),
                child: SvgPicture.asset(
                  'lib/assets/icons/back_arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
