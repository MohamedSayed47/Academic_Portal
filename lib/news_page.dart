import 'package:flutter/material.dart';

import 'home_page.dart';

import 'notifications_page.dart';

class news_page extends StatelessWidget {
  const news_page();

  // Hardcoded news data (can be replaced with API data in the future)
  static const List<Map<String, String>> newsData = [
    {'title': 'News Item 1', 'description': 'Description placeholder'},
    {'title': 'News Item 2', 'description': 'Description placeholder'},
    {'title': 'News Item 3', 'description': 'Description placeholder'},
    {'title': 'News Item 4', 'description': 'Description placeholder'},
    {'title': 'News Item 5', 'description': 'Description placeholder'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Light Blue Background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1), // Dark Blue
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFA726), // Orange
          ),
          onPressed: () {
            // Navigate to HomePageScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home_page()),
            );
          },
        ),
        title: const Text('News', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xFFFFA726), // Orange
            ),
            onPressed: () {
              // Navigate to NotificationsPageScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notifications_page()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                width: double.infinity,
                height: 100, // Fixed height for consistency
                decoration: BoxDecoration(
                  color: const Color(0xFFBBDEFB), // Solid Light Blue
                  borderRadius: BorderRadius.circular(16),
                ),
                // Placeholder for news content (can be customized later)
                child: const Center(
                  child: Text(
                    'News Card Placeholder',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
