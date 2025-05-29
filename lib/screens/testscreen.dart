import 'package:connect_mate/theme/theme.dart';
import 'package:connect_mate/widgets/primary_text_widget.dart';
import 'package:connect_mate/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrimaryTextField Test',
      theme: ThemeData(primarySwatch: AppColors.azureRadiance),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _currentTab = 0;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onNavTap(int idx) {
    setState(() => _currentTab = idx);
    // do your navigation logic here, e.g.
    // if (idx == 0) Navigator.pushNamed(...);
  }

  void _onLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Credentials'),
            content: Text('Username: $username\nPassword: $password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
        backgroundColor: AppColors.azureRadiance[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryTextField(
              placeholder: 'Username',
              isPassword: false,
              controller: _usernameController,
            ),
            const SizedBox(height: 16),
            PrimaryTextField(
              placeholder: 'Password',
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentTab,
        onTap: _onNavTap,
      ),
    );
  }
}
