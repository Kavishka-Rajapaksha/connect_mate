import 'package:flutter/material.dart';
import 'package:connect_mate/screens/history_screen.dart';
import 'package:connect_mate/screens/show_qr_screen.dart';
import 'package:connect_mate/screens/sign_up_page.dart'; // Add import for SignUpPage
import 'package:connect_mate/widgets/custom_bottom_nav_bar.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Mate',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Use SignUpPage as the initial screen instead of MainScreen
      home: const SignUpPage(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button from closing app
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            ShowQRScreen(),
            Scaffold(body: Center(child: Text('Scan QR Screen'))),
            HistoryScreen(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
        ),
      ),
    );
  }
}
