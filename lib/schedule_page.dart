import 'package:flutter/material.dart';
import 'student_profile.dart'; // تأكد أن الملف موجود في نفس المسار

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: schedule_page()));
}

class schedule_page extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<schedule_page> {
  final Map<String, List<Map<String, String>>> weeklyClasses = {
    'Saturday': [
      {
        'start': '8:30 AM',
        'end': '10:10 AM',
        'code': 'EBA2204',
        'title': 'Linear Algebra',
        'room': '251',
      },
      {
        'start': '10:30 AM',
        'end': '12:10 PM',
        'code': 'EBA2203',
        'title': 'Probability & Statistics',
        'room': '106',
      },
    ],
    'Sunday': [
      {
        'start': '9:00 AM',
        'end': '10:30 AM',
        'code': 'CSE1101',
        'title': 'Introduction to Programming',
        'room': '201',
      },
    ],
    'Monday': [
      {
        'start': '8:00 AM',
        'end': '9:40 AM',
        'code': 'MTH1102',
        'title': 'Calculus I',
        'room': '105',
      },
      {
        'start': '11:00 AM',
        'end': '12:40 PM',
        'code': 'PHY1103',
        'title': 'Physics I',
        'room': '107',
      },
    ],
    'Tuesday': [
      {
        'start': '10:00 AM',
        'end': '11:30 AM',
        'code': 'ENG1201',
        'title': 'Technical Writing',
        'room': '109',
      },
    ],
    'Wednesday': [
      {
        'start': '1:00 PM',
        'end': '2:30 PM',
        'code': 'ECO1302',
        'title': 'Microeconomics',
        'room': '110',
      },
    ],
    'Thursday': [],
    'Friday': [],
  };

  final List<String> days = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];

  String selectedDay = "Saturday";

  @override
  Widget build(BuildContext context) {
    final classes = weeklyClasses[selectedDay] ?? [];

    return Scaffold(
      backgroundColor: Color(0xFFF1F4FF),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Weekly Schedule'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 69, 79, 189),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => student_profile()),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 69, 79, 189),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    days.map((day) {
                      final bool isSelected = day == selectedDay;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = day;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Colors.orange
                                      : Color(0xFF3949AB),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
          Expanded(
            child:
                classes.isEmpty
                    ? Center(
                      child: Text('No classes scheduled for $selectedDay'),
                    )
                    : ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: classes.length,
                      itemBuilder: (context, index) {
                        final cls = classes[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ClassDetailsScreen(classData: cls),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      cls['start'] ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 34),
                                    Text(
                                      cls['end'] ?? '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1565C0),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 30,
                                      color: Colors.blue.shade200,
                                    ),
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1565C0),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Text(
                                              cls['code'] ?? '',
                                              style: TextStyle(
                                                color: Colors.blue.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Section',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          cls['title'] ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Room : ${cls['room'] ?? ''}',
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class ClassDetailsScreen extends StatelessWidget {
  final Map<String, String> classData;

  const ClassDetailsScreen({required this.classData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classData['title'] ?? 'Class Details'),
        backgroundColor: Color(0xFF1A237E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Code: ${classData['code']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Time: ${classData['start']} - ${classData['end']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Room: ${classData['room']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
