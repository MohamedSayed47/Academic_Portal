import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(120),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Section (SVG Icon + Texts)
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/user-circle.svg',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Student Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Text('student ID',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            // Right Icon (Notification Button)
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              iconSize: 28,
              onPressed: () {
                // Notification button action
              },
            ),
          ],
        ),
      ),
    );
  }
}
