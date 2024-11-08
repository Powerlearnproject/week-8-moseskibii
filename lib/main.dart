import 'package:flutter/material.dart';
import 'screens/send_money_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Transfer App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/send_money': (context) => SendMoneyPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
