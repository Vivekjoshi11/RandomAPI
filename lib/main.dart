import 'package:flutter/material.dart';
// import 'homepage.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 51, 8, 124)),
        useMaterial3: true,
      ),
      home: const MyForm(),
      initialRoute: "/form()",
    );
  }
}

