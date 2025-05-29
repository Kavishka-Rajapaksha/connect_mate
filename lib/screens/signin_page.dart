import 'package:flutter/material.dart';
import 'package:connect_mate/widgets/primary_button_wdget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connect_mate/theme/theme.dart';
import 'package:connect_mate/widgets/primary_text_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Blue wave logo
                Image.asset('lib/assets/icons/logo.png', height: 46, width: 36),
                const SizedBox(height: 32),

                // Title section aligned to the left
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In to your',
                        style: TextStyle(
                          color: AppColors.mailGray[950], // Using theme color
                          fontSize: 32,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          height: 1.30,
                          letterSpacing: -0.64,
                        ),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          color: AppColors.mailGray[950], // Using theme color
                          fontSize: 32,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          height: 1.30,
                          letterSpacing: -0.64,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Enter your email and password to log in',
                        style: TextStyle(
                          color: AppColors.mailGray[400], // Using theme color
                          fontSize: 12,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                          letterSpacing: -0.12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Email input using themed PrimaryTextField
                PrimaryTextField(
                  placeholder: 'Email',
                  controller: _emailController,
                  onChanged: (value) {
                    // Handle email changes if needed
                  },
                ),

                const SizedBox(height: 8),

                // Password input using themed PrimaryTextField
                PrimaryTextField(
                  placeholder: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                  onChanged: (value) {
                    // Handle password changes if needed
                  },
                ),

                const SizedBox(height: 24),

                // Primary login button
                PrimaryButton(
                  text: 'Log In',
                  onPressed: () {
                    // Handle sign in logic
                  },
                  backgroundColor:
                      AppColors.azureRadiance[600] ??
                      const Color(0xFF306AE0), // Add null check
                  borderRadius: 8,
                ),

                const SizedBox(height: 16),

                // Divider with "Or" text
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.mailGray[100]),
                    ), // Using theme color
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: AppColors.mailGray[500],
                        ), // Using theme color
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.mailGray[100]),
                    ), // Using theme color
                  ],
                ),

                const SizedBox(height: 16),

                // Google Sign In button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.mailGray[100] ?? Colors.grey[300]!,
                    ), // Add null check
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Replace Image.asset with SvgPicture.asset for SVG files
                      SvgPicture.asset(
                        'lib/assets/icons/google.svg',
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Sign up option at bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.mailGray[600],
                        fontSize: 14,
                      ), // Using theme color
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color:
                              AppColors.azureRadiance[600], // Using theme color
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
