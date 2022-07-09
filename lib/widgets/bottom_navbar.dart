import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final bool isHome;
  final bool isExplore;
  final bool isTrending;
  final bool isAccount;
  const BottomNavbar({
    Key? key,
    required this.isHome,
    required this.isExplore,
    required this.isTrending,
    required this.isAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: infoColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            // height: 60,
            child: IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                    color: isHome ? Colors.white : Colors.white70,
                  ),
                  // Text(
                  //   'Home',
                  //   style: TextStyle(
                  //     color: isHome ? Colors.white : Colors.white70,
                  //   ),
                  // ),
                ],
              ),
              onPressed: isHome
                  ? () {}
                  : () {
                      Navigator.of(context).pushNamed('/home');
                    },
            ),
          ),
          SizedBox(
            width: 80,
            // height: 60,
            child: IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.explore,
                    size: 30,
                    color: isExplore ? Colors.white : Colors.white70,
                  ),
                  // Text(
                  //   'Explore',
                  //   style: TextStyle(
                  //     color: isExplore ? Colors.white : Colors.white70,
                  //   ),
                  // ),
                ],
              ),
              onPressed: isExplore
                  ? () {}
                  : () {
                      Navigator.of(context).pushNamed('/explore');
                    },
            ),
          ),
          SizedBox(
            width: 80,
            // height: 60,
            child: IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 30,
                    color: isTrending ? Colors.white : Colors.white70,
                  ),
                  // Text(
                  //   'Trending',
                  //   style: TextStyle(
                  //     color: isTrending ? Colors.white : Colors.white70,
                  //   ),
                  // ),
                ],
              ),
              onPressed: isTrending
                  ? () {}
                  : () {
                      Navigator.of(context).pushNamed('/trending');
                    },
            ),
          ),
          SizedBox(
            width: 80,
            // height: 60,
            child: IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                    color: isAccount ? Colors.white : Colors.white70,
                  ),
                  // Text(
                  //   'Profile',
                  //   style: GoogleFonts.poppins(
                  //     color: isAccount ? Colors.white : Colors.white70,
                  //     fontSize: 13,
                  //   ),
                  // ),
                ],
              ),
              onPressed: isAccount
                  ? () {}
                  : () {
                      Navigator.of(context).pushNamed('/profile');
                    },
            ),
          ),
        ],
      ),
    );
  }
}
