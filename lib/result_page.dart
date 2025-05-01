import 'home_page.dart';
import 'notifications_page.dart';
import 'package:flutter/material.dart';

class result_page extends StatefulWidget {
  const result_page();

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<result_page> {
  String selectedSemester = 'February 2025'; // Default semester

  // Hardcoded results data for different semesters (can be replaced with API data in the future)
  static const Map<String, Map<String, dynamic>> resultsData = {
    'February 2025': {
      'creditAchieved': '45.0',
      'gpa': '1.90',
      'courses': [
        {
          'name': 'Linear algebra',
          'credits': '8.00',
          'grades': {'Year\'s Work': 20, 'Mid': 30, 'Final': 40},
        },
        {
          'name': 'Probability & statistics',
          'credits': '10.00',
          'grades': {'Year\'s Work': 15, 'Mid': 25, 'Final': 35},
        },
        {
          'name': 'Database systems',
          'credits': '26.00',
          'grades': {'Year\'s Work': 25, 'Mid': 35, 'Final': 30},
        },
        {
          'name': 'Introduction to cybersecurity',
          'credits': '24.00',
          'grades': {'Year\'s Work': 10, 'Mid': 20, 'Final': 40},
        },
      ],
    },
    'September 2024': {
      'creditAchieved': '40.0',
      'gpa': '2.10',
      'courses': [
        {
          'name': 'Linear algebra',
          'credits': '8.00',
          'grades': {'Year\'s Work': 18, 'Mid': 28, 'Final': 38},
        },
        {
          'name': 'Probability & statistics',
          'credits': '10.00',
          'grades': {'Year\'s Work': 12, 'Mid': 22, 'Final': 32},
        },
        {
          'name': 'Database systems',
          'credits': '26.00',
          'grades': {'Year\'s Work': 20, 'Mid': 30, 'Final': 25},
        },
        {
          'name': 'Introduction to cybersecurity',
          'credits': '24.00',
          'grades': {'Year\'s Work': 15, 'Mid': 25, 'Final': 35},
        },
      ],
    },
    'Summer 2024': {
      'creditAchieved': '35.0',
      'gpa': '2.50',
      'courses': [
        {
          'name': 'Linear algebra',
          'credits': '8.00',
          'grades': {'Year\'s Work': 22, 'Mid': 32, 'Final': 42},
        },
        {
          'name': 'Probability & statistics',
          'credits': '10.00',
          'grades': {'Year\'s Work': 18, 'Mid': 28, 'Final': 38},
        },
        {
          'name': 'Database systems',
          'credits': '26.00',
          'grades': {'Year\'s Work': 30, 'Mid': 40, 'Final': 20},
        },
        {
          'name': 'Introduction to cybersecurity',
          'credits': '24.00',
          'grades': {'Year\'s Work': 20, 'Mid': 30, 'Final': 45},
        },
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final currentSemesterData = resultsData[selectedSemester]!;
    final semesters = resultsData.keys.toList();

    return Scaffold(
      backgroundColor:  Color(0xFF0D47A1), // Darker blue for the top section
      appBar: AppBar(
        backgroundColor:  Color(0xFF0D47A1), // Darker blue
        elevation: 4, // Shadow for depth
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFA726), // Orange
          ),
          onPressed: () {
            // Navigate to HomePageScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const home_page(),
              ),
            );
          },
        ),
        title: const Text(
          'Results',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xFFFFA726), // Grey profile icon
            ),
            onPressed: () {
              // Navigate to NotificationsPageScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const notifications_page(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top section with dark blue background (behind GPA card and semester buttons)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Section: Credit Achieved and GPA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // White card
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            currentSemesterData['creditAchieved'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Credit Achieved',
                            style: TextStyle(fontSize: 14, color: Colors.grey[00]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            currentSemesterData['gpa'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'GPA',
                            style: TextStyle(fontSize: 14, color: Colors.grey[00]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Semester Buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: semesters.map<Widget>((semester) {
                      bool isSelected = semester == selectedSemester;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedSemester = semester;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected
                                ? const Color(0xFFFFA726) // Orange
                                : Colors.grey[300], // Darker grey for unselected
                            foregroundColor: isSelected ? Colors.white : Colors.white, // White for better contrast on dark blue background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                          ),
                          child: Text(
                            semester,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // Bottom section with white background (behind course result cards)
          Expanded(
            child: Container(
              color: Colors.white, // White background for course cards
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: currentSemesterData['courses'].length,
                  itemBuilder: (context, index) {
                    final course = currentSemesterData['courses'][index];
                    final totalDegree = course['grades']['Year\'s Work'] +
                        course['grades']['Mid'] +
                        course['grades']['Final'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white, // White card
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  course['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  course['credits'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Total: $totalDegree',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${course['grades']['Year\'s Work']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 0),
                                    Text(
                                      'Year\'s Work',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${course['grades']['Mid']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 0),
                                    Text(
                                      'Mid',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${course['grades']['Final']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 0),
                                    Text(
                                      'Final',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}