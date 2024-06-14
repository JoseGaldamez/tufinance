import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/providers/login_provider.dart';
import 'package:tufinance/screens/home_screen.dart';
import 'package:tufinance/screens/login_screen.dart';
import 'package:tufinance/screens/register_screen.dart';
import 'package:tufinance/screens/welcome_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tu Finance',
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/welcome': (context) => const WelcomeRegisterScreen()
        });
  }
}
