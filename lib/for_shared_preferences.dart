import 'package:flutter/material.dart';
import 'package:for_shared_preferences/ui/screens/home_screen.dart';

class ForSharedPreferences extends StatelessWidget {
  const ForSharedPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
