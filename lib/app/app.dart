import 'package:bakery_app/Screen/wearos/wear_login.dart';
import 'package:bakery_app/app/theme.dart';
import 'package:flutter/material.dart';

import '../Screen/dashboad.dart';
import '../screen/login.dart';
import '../screen/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required bool debugShowCheckedModeBanner,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Bakery',
      debugShowCheckedModeBanner: false,
      theme: getApplicationThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/registerScreen': (context) => const Register(),
        '/dashboardScreen': (context) => const DashboardScreen(),
        // '/WatchLoginScreen': (context) => const WearLoginScreen(),
      },
    );
  }
}
