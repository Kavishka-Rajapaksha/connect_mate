// lib/widgets/custom_bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';

class BottomNavItem {
  final String title;
  final String assetName;
  const BottomNavItem(this.title, this.assetName);
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double _barHeight = 99;
  static const double _iconSize = 24;
  static const List<BottomNavItem> _items = [
    BottomNavItem('Show QR', 'lib/assets/icons/QrCode.svg'),
    BottomNavItem('Scan QR', 'lib/assets/icons/Scan.svg'),
    BottomNavItem('History', 'lib/assets/icons/History.svg'),
  ];

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _barHeight,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // ← bar is white now
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: List.generate(_items.length, (i) {
          final item = _items[i];
          final isSelected = i == currentIndex;
          final iconColor =
              isSelected
                  ? AppColors.azureRadiance[500]!
                  : AppColors.mailGray[400]!;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.translucent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 100 : 100, // Decrease width when selected
                height: isSelected ? 70 : 70, // Increase height when selected
                padding:
                    isSelected
                        ? const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        )
                        : EdgeInsets.zero,
                decoration:
                    isSelected
                        ? BoxDecoration(
                          color: AppColors.azureRadiance[50],
                          borderRadius: BorderRadius.circular(12),
                        )
                        : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item.assetName,
                      width: _iconSize,
                      height: _iconSize,
                      color: iconColor,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
