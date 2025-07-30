// lib/main.dart
import 'package:demoappfortest/screens/demo.dart';
import 'package:demoappfortest/screens/login_with_otp_screen.dart';
import 'package:demoappfortest/screens/razor_pay_screen.dart';
import 'package:demoappfortest/screens/seat_selection_screen2.dart';
import 'package:demoappfortest/screens/signup_screen.dart';
import 'package:demoappfortest/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/seat_selection_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BusBookingApp());
}

class BusBookingApp extends StatelessWidget {
  const BusBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Booking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // or ThemeMode.light / dark
      home: LoginWithOtpScreen(),
    );
  }
}
