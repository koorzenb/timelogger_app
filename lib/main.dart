import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelogger_app/screens/home_page.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeLogger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan).copyWith(secondary: Colors.white),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      home: const HomePage(),
    );
  }
}
