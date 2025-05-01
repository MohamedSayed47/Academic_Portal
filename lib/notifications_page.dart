import 'package:flutter/material.dart';

class notifications_page extends StatelessWidget {
  final List<String> notifications = [
    'New assignment uploaded',
    'Exam schedule updated',
    'Your grade for Calculus I is available',
    'Meeting with advisor at 2 PM',
    'Library book due tomorrow',
    'New announcement in Cybersecurity course',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(notifications[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped: ${notifications[index]}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
