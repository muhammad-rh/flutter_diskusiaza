import 'package:diskusiaza_mobile/screens/detail/detail_view_model.dart';
import 'package:diskusiaza_mobile/screens/explore/explore_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/login/login_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_detail_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_screen.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/screens/register/register_screen.dart';
import 'package:diskusiaza_mobile/screens/splash/splash_screen.dart';
import 'package:diskusiaza_mobile/screens/trending/trending_screen.dart';
import 'package:diskusiaza_mobile/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => DetailViewModel()),
      ],
      child: MaterialApp(
        title: 'Diskuziaza',
        theme: ThemeData(
          primaryColor: const Color(0xFF36a5b2),
          backgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF007ADD),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        // routes: {
        //   '/': (context) => const SplashScreen(),
        //   '/login': (context) => const LoginScreen(),
        //   '/register': (context) => const RegisterScreen(),
        //   '/home': (context) => const HomeScreen(),
        //   '/explore': (context) => const ExploreScreen(),
        //   '/trending': (context) => const TrendingScreen(),
        //   '/profile': (context) => const ProfileScreen(),
        //   '/profileDetail': (context) => const ProfileDetailScreen(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                child: const SplashScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/login':
              return PageTransition(
                child: const LoginScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/register':
              return PageTransition(
                child: const RegisterScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/home':
              return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/explore':
              return PageTransition(
                child: const ExploreScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/trending':
              return PageTransition(
                child: const TrendingScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/profile':
              return PageTransition(
                child: const ProfileScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/profileDetail':
              return PageTransition(
                child: const ProfileDetailScreen(),
                type: PageTransitionType.fade,
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
