import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/user_list_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Example user data - in a real app this would come from a database or API
  final List<Map<String, String>> _users = [
    {
      'name': 'John Smith',
      'email': 'john.smith@example.com',
      'date': '15 Jun 2023',
    },
    {
      'name': 'Emma Johnson',
      'email': 'emma.johnson@example.com',
      'date': '12 Jun 2023',
    },
    {
      'name': 'Michael Brown',
      'email': 'michael.brown@example.com',
      'date': '10 Jun 2023',
    },
    {
      'name': 'Sarah Davis',
      'email': 'sarah.davis@example.com',
      'date': '05 Jun 2023',
    },
    {
      'name': 'David Wilson',
      'email': 'david.wilson@example.com',
      'date': '01 Jun 2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Header(
          name: 'Chanuka',
          onBackPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // History title

            // List of user items
            Expanded(
              child: ListView.separated(
                itemCount: _users.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return UserListItem(
                    name: user['name']!,
                    email: user['email']!,
                    date: user['date']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
