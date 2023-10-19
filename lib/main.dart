import 'package:block_architecture/features/home/ui/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode ? false : false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal, primaryColor: Colors.teal),
      home: const HomeView(),
    );
  }
}
