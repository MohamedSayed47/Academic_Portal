import 'package:flutter/material.dart';
import 'material_page.dart';
import 'community_page.dart';
import 'student_profile.dart';
import 'notifications_page.dart';
import 'result_page.dart';
import 'schedule_page.dart';
import 'news_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      debugShowCheckedModeBanner: false,
      home: home_page(),
      routes: {
        '/results': (context) => result_page(),
        '/news': (context) => news_page(),
        '/schedule': (context) => schedule_page(),
        '/qr': (context) => PlaceholderPage(title: 'QR Attendance Page'),
        '/bus': (context) => PlaceholderPage(title: 'Bus A Page'),
        '/announcement': (context) => news_page(),
        '/lecture': (context) => schedule_page(),
        '/notifications': (context) => notifications_page(),
      },
    );
  }
}

class home_page extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home_page> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContentPage(),
    material_page(),
    CommunityPage(),
    student_profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF0363F2),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Material',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Student'),
        ],
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 213, 234, 239),
      body: Column(
        children: [
          ClipPath(
            clipper: CurvedAppBarClipper(),
            child: Container(
              height: 140,
              color: Colors.blue[800],
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 25,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Mohamed',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '231003561',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildActivityIcon(
                            context,
                            Icons.assessment,
                            'Results',
                            '/results',
                          ),
                          _buildActivityIcon(
                            context,
                            Icons.article,
                            'News',
                            '/news',
                          ),
                          _buildActivityIcon(
                            context,
                            Icons.schedule,
                            'Schedule',
                            '/schedule',
                          ),
                          _buildActivityIcon(
                            context,
                            Icons.qr_code,
                            'QR Attendance',
                            '/qr',
                          ),
                          _buildActivityIcon(
                            context,
                            Icons.directions_bus,
                            'Bus A',
                            '/bus',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Announcements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/announcement');
                          },
                          child: Text('View All'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(
                          'DR Sara Shehab',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Dear students, we congratulate you on the start of the semesters work...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/announcement');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Saturday 22 Feb',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/schedule');
                          },
                          child: Text('My Schedule'),
                        ),
                      ],
                    ),
                  ),
                  _buildScheduleItem(
                    context,
                    '8:30 AM',
                    'Linear Algebra',
                    'Room: 251',
                  ),
                  _buildScheduleItem(
                    context,
                    '9:30 AM',
                    'Physics',
                    'Room: 221',
                  ),
                  _buildScheduleItem(
                    context,
                    '10:30 AM',
                    'Probability & Statistics',
                    'Room: 106',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityIcon(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue[100],
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 51, 25, 220),
                size: 30,
              ),
            ),
            SizedBox(height: 5),
            Text(label, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(
    BuildContext context,
    String time,
    String subject,
    String room,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Text(time, style: TextStyle(fontSize: 16)),
          title: Text(subject, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: room,
                  style: TextStyle(
                    color:
                        (room == 'Room: 221' ||
                                room == 'Room: 251' ||
                                room == 'Room: 106')
                            ? Colors.yellow[800]
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              style: DefaultTextStyle.of(context).style,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.pushNamed(context, '/lecture');
          },
        ),
      ),
    );
  }
}

class CurvedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.blue[900]),
      body: Center(child: Text('$title content goes here.')),
    );
  }
}
