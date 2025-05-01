import 'package:flutter/material.dart';
import 'course_details_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: community_page(),
    ),
  );
}

class community_page extends StatelessWidget {
  const community_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic_Portal'),
        backgroundColor: const Color(0xFF00194A),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications, color: Colors.amber),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'My Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              children: [
                buildCourse(
                  context,
                  'CIS2101',
                  'Database Systems',
                  Colors.green,
                ),
                buildCourse(
                  context,
                  'EBA2203',
                  'Probability & Statistics',
                  Colors.blue,
                ),
                buildCourse(context, 'EBA2204', 'Linear Algebra', Colors.red),
                buildCourse(context, 'CCY2001', 'Cybersecurity', Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCourse(
      BuildContext context,
      String code,
      String title,
      Color color,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                course_details_page(courseCode: code, courseTitle: title),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.menu_book, size: 40, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 10),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}