import 'package:flutter/material.dart';

class student_profile extends StatelessWidget {
  const student_profile();

  // Hardcoded student data as a static const map
  static const Map<String, String> studentData = {
    'name': 'John Doe',
    'id': '123456789',
    'email': 'john.doe@example.com',
    'major': 'Computer Science',
    'year': '3rd Year',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light Blue Background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Student ID Section
                Text(
                  'Student ID',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0D47A1), // Dark Blue
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xFF42A5F5), // Vibrant Blue
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                studentData['name']!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF0D47A1), // Dark Blue
                                ),
                              ),
                              Text(
                                'ID: ${studentData['id']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xFF1976D2), // Medium Blue
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Placeholder for barcode
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: const Color(0xFFBBDEFB), // Light Blue
                        child: const Center(
                          child: Text(
                            'Barcode Placeholder',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Profile Section
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0D47A1), // Dark Blue
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xFF42A5F5), // Vibrant Blue
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          studentData['name']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF000000), // Dark Blue
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Email: ${studentData['email']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF000000), // Medium Blue
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Major: ${studentData['major']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF000000), // Medium Blue
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Year: ${studentData['year']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF000000), // Medium Blue
                        ),
                      ),
                    ],
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
