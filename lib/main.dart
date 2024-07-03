import 'package:ayurr/pages/login_page.dart';
import 'package:ayurr/providers/genderCounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GenderProvider()),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
