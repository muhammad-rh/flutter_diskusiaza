import 'package:flutter/material.dart';

class AvatarPict extends StatelessWidget {
  const AvatarPict({
    required this.urlPict,
    required this.radiusPict,
    Key? key,
  }) : super(key: key);

  final String urlPict;
  final double radiusPict;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusPict,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(radiusPict),
          child: Image.asset(
            urlPict,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
