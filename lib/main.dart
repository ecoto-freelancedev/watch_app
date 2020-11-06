import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:watch_app/screens/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.brown.withOpacity(0.2), // navigation bar color
      statusBarColor: Colors.brown.withOpacity(0.2) // status bar color
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nixon Watch App',
      home: HomePage(),
    );
  }
}
