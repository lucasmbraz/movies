import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return ClipPath(
      child: Container(
        color: MovieColors.primary,
        width: screenWidth,
        height: MediaQuery.of(context).size.width - 10.0
      ),
      clipper: _DiagonalClipper(),
    );
  }
}

class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}