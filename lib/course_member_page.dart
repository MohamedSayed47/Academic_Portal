import 'package:flutter/material.dart';
import 'course_details_page.dart';
import 'newsfeeds_page.dart';

class course_member_page extends StatelessWidget {
  final String courseCode;
  final String courseTitle;

  const course_member_page({
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
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => newsfeeds_page(
            courseCode: courseCode,
            courseTitle: courseTitle,
          ),
        ),
      );
    }
  }

  final List<String> instructors = const [
    'Mohamed Elseyed',
    'Abdallah mohamed',
  ];

  final List<String> students = const [
    'Mohamed Sayed',
    'Abdallah shaaban',
    'Mahmoud adel ',
    'Mohamed Elshamey',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Members',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Instructors',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...instructors.map(_buildTile).toList(),
            const SizedBox(height: 12),
            const Text(
              'Students',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...students.map(_buildTile).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

  Widget _buildTile(String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
      ),
    );
  }
}