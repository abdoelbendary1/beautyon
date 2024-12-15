import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircleButton(FontAwesomeIcons.facebookF, Colors.blue),
        const SizedBox(width: 20),
        _buildCircleButton(FontAwesomeIcons.google, Colors.red),
        const SizedBox(width: 20),
        _buildCircleButton(FontAwesomeIcons.apple, Colors.black),
      ],
    );
  }

  Widget _buildCircleButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }
}
