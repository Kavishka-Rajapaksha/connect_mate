// lib/widgets/user_list_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';

class UserListItem extends StatelessWidget {
  final String name;
  final String email;
  final String date;

  const UserListItem({
    Key? key,
    required this.name,
    required this.email,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // medium corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SVG icon from assets
          SvgPicture.asset(
            'lib/assets/icons/UserCircle.svg',
            width: 31,
            height: 31,
            color: AppColors.mailGray[900], // dark icon tint
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(width: 12),
          // Name & email
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mailGray[900],
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.mailGray[400],
                  ),
                ),
              ],
            ),
          ),
          // Date
          Text(
            date,
            style: TextStyle(fontSize: 10, color: AppColors.mailGray[400]),
          ),
        ],
      ),
    );
  }
}
