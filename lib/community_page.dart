import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Text(
          'Welcome to the Community Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
