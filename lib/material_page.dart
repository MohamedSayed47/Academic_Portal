import 'package:flutter/material.dart';

class Course {
  final String title;
  final Color color;

  Course(this.title, this.color);
}

class material_page extends StatelessWidget {
  final List<Course> courses = [
    Course('Database Systems', Colors.green.shade400),
    Course('Probability & Statistics', Colors.blue.shade400),
    Course('Linear Algebra', Colors.red.shade300),
    Course('Introduction to Cybersecurity', Colors.red.shade400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FAFF),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: courses.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(
              course,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CourseMaterialsScreen(courseName: course.title),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  CourseCard(this.course, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.menu_book_rounded, color: Colors.white, size: 40),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                course.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_forward, color: course.color),
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
    final List<String> lectures = ['Lec 1', 'Lec 2', 'Lec 3', 'Lec 4', 'Lec 5'];

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
                        Text(lecture, style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.blue),
                          onPressed: () {
                            // Placeholder for download action
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Download $lecture for $courseName',
                                ),
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
