import 'package:academic_portal/widgets/appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CustomAppBar(),
      body: Center(
        child: Text(
          'Welcome to the Courses Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
