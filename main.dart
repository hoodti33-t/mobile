import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'aftersplash.dart';

void main() {
  runApp(MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue)));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/OIP1.jpg'),
      title: const Text(
        'John Robinson\n\n\n\nRUFW\n\n\n\n3/30/2022',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor: const Color(0xFFFFCC00), //ANY COLOR YOU CHOOSE
      showLoader: true,
      loaderColor: const Color(0xFF57150B), //ANY COLOR YOU CHOOSE
      loadingText: const Text('Starting RUFW'),
      navigator: const AfterSplash(),
      durationInSeconds: 5,
    );
  }
}
