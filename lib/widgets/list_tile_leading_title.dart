import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ListTileLeadingTitle extends StatelessWidget {
  const ListTileLeadingTitle({
    Key? key,
    required this.onCreate,
    required this.icons,
    required this.title,
  }) : super(key: key);

  final Function() onCreate;
  final IconData icons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCreate,
      child: ListTile(
        leading: Icon(
          icons,
          color: Colors.black,
          size: 28,
        ),
        title: Text(
          title,
          style: poppinsRegular(
            16,
            Colors.black,
          ),
        ),
      ),
    );
  }
}
