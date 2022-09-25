import 'package:flutter/material.dart';
import 'homepage.dart';

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RUFW',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            scaffoldBackgroundColor: const Color(0xFFFFCC00)),
        home: const HomePage(),
        /******* ROUTE DEFINITIONS ******/
        routes: <String, WidgetBuilder>{
          "GeneralInfoPage": (BuildContext context) => const GeneralInfo(),
          "ClassPage": (BuildContext context) => const ClassPage(),
        });
  }
}
