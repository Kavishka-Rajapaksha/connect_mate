import 'package:connect_mate/theme/theme.dart';
import 'package:connect_mate/widgets/primary_text_widget.dart';
import 'package:connect_mate/widgets/custom_bottom_nav_bar.dart';
import 'package:connect_mate/widgets/user_list_item.dart';
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

final List<Map<String, String>> _users = const [
  {
    'name': 'Chanuka Saranga',
    'email': 'chanuka@gmail.com',
    'date': '2025-05-24',
  },
  {'name': 'Jane Doe', 'email': 'jane.doe@example.com', 'date': '2025-05-20'},
  {
    'name': 'John Smith',
    'email': 'john.smith@example.com',
    'date': '2025-05-18',
  },
];

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
        title: Text(_currentTab == 2 ? 'Users' : 'Test Screen'),
        backgroundColor: AppColors.azureRadiance[500],
      ),
      body: _currentTab == 2 ? _buildUserList() : _buildLoginForm(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentTab,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
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
    );
  }

  Widget _buildUserList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, idx) {
        final user = _users[idx];
        return UserListItem(
          name: user['name']!,
          email: user['email']!,
          date: user['date']!,
        );
      },
    );
  }
}
