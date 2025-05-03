import 'package:academic_portal/login_page.dart';
import 'package:flutter/material.dart';



class student_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = 'Mohamed';
    String email = '1223310@example.com';
    String id = '1223310';
    String department = 'Computer Science';
    String specialization = 'Cybersecurity';
    String year = '3rd Year';

    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Avatar with person icon
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 40, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(email, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Student Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            SizedBox(height: 12),

            // Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _info('Student ID', id),
                    _info('Department', department),
                    _info('Specialization', specialization),
                    _info('Year', year),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // ID Card Placeholder
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Student ID Card (Coming Soon)',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),

            Spacer(),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Logout'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
