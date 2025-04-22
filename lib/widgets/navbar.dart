import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Home/home_page.dart';
import '../community/community_page.dart';
import '../student_profile.dart';
import '../Home/schedule_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = SchedulePage();
        break;
      case 2:
        page = CommunityPage();
        break;
      case 3:
        page = studentprofilePage();
        break;
      default:
        page = HomePage();
    }

    // 👇 Use PageRouteBuilder for animated transition
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // 👇 Fade transition (smooth fade effect)
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/comment-message.svg',
            width: 24,
            height: 24,
          ),
          label: 'community',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/qrcode-scan.svg',
            width: 24,
            height: 24,
          ),
          label: 'Profile',
            
        ),
      ],
    );
  }

}
