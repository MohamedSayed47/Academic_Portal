import 'package:flutter/material.dart';
import 'course_details_page.dart';
import 'course_member_page.dart';

class newsfeeds_page extends StatelessWidget {
  final String courseCode;
  final String courseTitle;

  const newsfeeds_page({
    Key? key,
    required this.courseCode,
    required this.courseTitle,
  }) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => course_details_page(
            courseCode: courseCode,
            courseTitle: courseTitle,
          ),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => course_member_page(
            courseCode: courseCode,
            courseTitle: courseTitle,
          ),
        ),
      );
    }
  }

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
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00194A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '$courseCode - $courseTitle',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.amber,
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'NewsFeed',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            final item = newsData[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFBBDEFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF00194A),
        onTap: (index) => _onTabTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'NewsFeeds',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Members'),
        ],
      ),
    );
  }
}