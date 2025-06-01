import 'package:connect_mate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/primary_button_wdget.dart';
import '../widgets/primary_text_widget.dart';

class QRGeneratedBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enable scroll control
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        // Get the keyboard height to adjust padding
        final mediaQuery = MediaQuery.of(context);
        final keyboardHeight = mediaQuery.viewInsets.bottom;

        return Padding(
          // Add padding to account for keyboard
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: keyboardHeight + 16.0,
          ),
          child: SingleChildScrollView(
            // Wrap in SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Add a draggable indicator at the top
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.blue,
                  child: Text(
                    'CJ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/UserCircle.svg',
                      width: 20,
                      height: 20,
                      color: AppColors.azureRadiance[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Chamuditha Jayod',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.azureRadiance[400],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/email.svg',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'chamuditha@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.azureRadiance[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/phone.svg',

                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '077 104 8900',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.azureRadiance[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6F0FA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: double.infinity,
                  child: Text(
                    'Hi My Name is Test User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.azureRadiance[600],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                PrimaryTextField(
                  placeholder:
                      'Add a note for your scan history (Optional)', // Remove count from placeholder
                  onChanged: (value) {},
                  isHistory: true,
                ),
                SizedBox(height: 16),
                PrimaryButton(
                  text: 'Save My Note',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 8),
                PrimaryButton(
                  text: 'Save Contact to Phone',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isOutlined: true,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
