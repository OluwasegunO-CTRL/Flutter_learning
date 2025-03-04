import 'package:flutter/material.dart';
import 'package:flutter_widget/text_field_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const TextFieldExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
