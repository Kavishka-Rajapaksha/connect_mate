import 'package:flutter/material.dart';
import 'package:connect_mate/widgets/primary_button_wdget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connect_mate/theme/theme.dart';
import 'package:connect_mate/widgets/primary_text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),

                      // Header section
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up to your Account',
                            style: TextStyle(
                              color: AppColors.mailGray[950],
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
                              color: AppColors.mailGray[400],
                              fontSize: 12,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                              letterSpacing: -0.12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Form fields
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryTextField(
                            placeholder: 'Name',
                            controller: _nameController,
                            onChanged: (value) {},
                          ),

                          const SizedBox(height: 8),
                          PrimaryTextField(
                            placeholder: 'Email',
                            controller: _emailController,
                            onChanged: (value) {},
                          ),

                          const SizedBox(height: 8),

                          // Password field
                          PrimaryTextField(
                            placeholder: 'Password',
                            isPassword: true,
                            controller: _passwordController,
                            onChanged: (value) {
                              // Handle password changes if needed
                            },
                          ),

                          const SizedBox(height: 8),

                          // Phone number field (optional)
                          PrimaryTextField(
                            placeholder: 'Phone Number (Optional)',
                            controller: _phoneController,
                            onChanged: (value) {
                              // Handle phone changes if needed
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Sign Up Button
                      PrimaryButton(
                        text: 'Sign Up',
                        onPressed: () {
                          // Handle sign up logic
                        },
                        backgroundColor:
                            AppColors.azureRadiance[600] ??
                            const Color(0xFF306AE0),
                        borderRadius: 4,
                      ),

                      const SizedBox(height: 16),

                      // Divider with "Or" text
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColors.mailGray[100]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or',
                              style: TextStyle(
                                color: AppColors.mailGray[400],
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: -0.12,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: AppColors.mailGray[100]),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Google Sign Up button
                      PrimaryButton(
                        text: 'Continue with Google',
                        onPressed: () {
                          // Handle Google sign up
                        },
                        isGoogle: true,
                        borderRadius: 4,
                        googleIcon: SvgPicture.asset(
                          'lib/assets/icons/google.svg',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom login option
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: TextStyle(
                        color: AppColors.mailGray[400],
                        fontSize: 12,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: AppColors.azureRadiance[600],
                          fontSize: 12,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          height: 1.40,
                          letterSpacing: -0.12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
