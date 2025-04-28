import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class material_page extends StatelessWidget {
  // Define a list of 6 static colors
  static const List<Color> courseColors = [
    Color(0xFF388E3C), // Green
    Color(0xFF1976D2), // Blue
    Color(0xFFEF5350), // Red
    Color(0xFFFFA726), // Orange
    Color(0xFFAB47BC), // Purple
    Color(0xFF26C6DA), // Cyan
  ];

  // Hardcoded list of course names
  final List<String> courses = [
    'Database Systems',
    'Probability & Statistics',
    'Linear Algebra',
    'Intro to Cybersecurity',
    'Calculus I',
    'Physics I',
    'Chemistry I',
    'Biology I',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final courseName = courses[index];
            // Cycle through colors using modulo
            final color = courseColors[index % courseColors.length];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0), // Space between cards
              child: CourseCard(
                name: courseName,
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String name;
  final Color color;

  const CourseCard({
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CourseMaterialsScreen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseMaterialsScreen(courseName: name),
          ),
        );
      },
      child: Container(
        width: double.infinity, // Take full screen width
        height: 150, // Fixed height for consistency
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: SvgPicture.asset(
                'assets/icons/books.svg',
                width: 40,
                height: 40,
                color: Colors.white54,
                placeholderBuilder: (context) => Icon(
                  Icons.error,
                  color: Colors.white54,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------------------

class CourseMaterialsScreen extends StatelessWidget {
  final String courseName;

  const CourseMaterialsScreen({required this.courseName});

  @override
  Widget build(BuildContext context) {
    // Example list of lectures (placeholder)
    final List<String> lectures = [
      'Lec 1',
      'Lec 2',
      'Lec 3',
      'Lec 4',
      'Lec 5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Materials for $courseName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: lectures.length,
                itemBuilder: (context, index) {
                  final lecture = lectures[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lecture,
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.blue),
                          onPressed: () {
                            // Placeholder for download action
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Download $lecture for $courseName'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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