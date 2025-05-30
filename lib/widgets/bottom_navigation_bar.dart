import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';

class BottomNavItem {
  final String label;
  final String assetName;

  BottomNavItem(this.label, this.assetName);
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double _barHeight = 99;
  static const double _topPadding = 8;

  static final List<BottomNavItem> _items = [
    BottomNavItem('Show QR', 'assets/icons/QrCode.svg'),
    BottomNavItem('Scan QR', 'assets/icons/ScanQr.svg'),
    BottomNavItem('History', 'assets/icons/History.svg'),
  ];

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390, // per your spec
      height: _barHeight,
      padding: const EdgeInsets.only(top: _topPadding),
      decoration: BoxDecoration(
        color: AppColors.mailGray[50],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_items.length, (i) {
          final item = _items[i];
          final selected = i == currentIndex;

          final iconColor =
              selected
                  ? AppColors.azureRadiance[500]!
                  : AppColors.mailGray[400]!;

          final textStyle = TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: iconColor,
          );

          final child = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.assetName,
                width: 24,
                height: 24,
                color: iconColor,
              ),
              const SizedBox(height: 4),
              Text(item.label, style: textStyle),
            ],
          );

          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.translucent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  selected
                      ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                      : EdgeInsets.zero,
              decoration:
                  selected
                      ? BoxDecoration(
                        color: AppColors.azureRadiance[50],
                        borderRadius: BorderRadius.circular(16),
                      )
                      : null,
              child: child,
            ),
          );
        }),
      ),
    );
  }
}
