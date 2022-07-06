import 'package:flutter/material.dart';
import 'package:full_bike_fit_pdf_gen_v01/screens/setup_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
      ),
      home: const SetupPage(),
    );
  }
}
