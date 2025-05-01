import 'package:flutter/material.dart';
import 'newsfeeds_page.dart';
import 'course_member_page.dart';

class course_details_page extends StatelessWidget {
  final String courseCode;
  final String courseTitle;

  const course_details_page({
    Key? key,
    required this.courseCode,
    required this.courseTitle,
  }) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    if (index == 1) {
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
          style: const TextStyle(color: Colors.white),
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
              'Course Details',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Results', onTap: () {}),
            const SizedBox(height: 8),
            _buildResultCard(),
            const SizedBox(height: 16),
            _buildSectionTitle('Lecturers & Office Hours', onTap: () {}),
            const SizedBox(height: 8),
            _buildLecturerCard('Abdallah Mohamed Mahmoud'),
            const SizedBox(height: 16),
            _buildSectionTitle('Schedule', onTap: () {}),
            const SizedBox(height: 8),
            _buildScheduleCard(
              time: '2:30 PM',
              title: courseTitle,
              room: '249',
            ),
            const SizedBox(height: 8),
            _buildScheduleCard(
              time: '8:10 AM',
              title: courseTitle,
              room: '204',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

  Widget _buildSectionTitle(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'To Results',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              courseCode,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(courseTitle, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ResultItem(label: '7th Week', value: '24.00'),
                _ResultItem(label: '12th Week', value: 'U'),
                _ResultItem(label: 'Course Work', value: 'U'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLecturerCard(String lecturerName) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(lecturerName),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () {},
      ),
    );
  }

  Widget _buildScheduleCard({
    required String time,
    required String title,
    required String room,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.access_time, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Room : $room'),
        trailing: Text(time),
      ),
    );
  }
}

class _ResultItem extends StatelessWidget {
  final String label;
  final String value;

  const _ResultItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}