import 'package:flutter/material.dart';

class AppColors {
  // -- Azure Radiance (Main Blue) --
  static const int _azurePrimaryValue = 0xFF4587EC;
  static const MaterialColor azureRadiance =
      MaterialColor(_azurePrimaryValue, <int, Color>{
        50: Color(0xFFF0F6FE),
        100: Color(0xFFDDEAFE),
        200: Color(0xFFC2DCFB),
        300: Color(0xFF99C6F7),
        400: Color(0xFF68A8F2),
        500: Color(0xFF4587EC),
        600: Color(0xFF306AE0),
        700: Color(0xFF2756CE),
        800: Color(0xFF2646A7),
        900: Color(0xFF243E84),
        950: Color(0xFF1A2851),
      });

  // -- Shark (Mail Gray) --
  static const int _mailGrayPrimaryValue = 0xFF6D6D6D;
  static const MaterialColor mailGray =
      MaterialColor(_mailGrayPrimaryValue, <int, Color>{
        50: Color(0xFFF6F6F6),
        100: Color(0xFFE7E7E7),
        200: Color(0xFFD1D1D1),
        300: Color(0xFFB0B0B0),
        400: Color(0xFF888888),
        500: Color(0xFF6D6D6D),
        600: Color(0xFF5D5D5D),
        700: Color(0xFF4F4F4F),
        800: Color(0xFF454545),
        900: Color(0xFF3D3D3D),
        950: Color(0xFF252525),
      });
}
