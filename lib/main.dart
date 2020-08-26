import 'package:flutter/material.dart';
import 'package:flutter_ui/config/palette.dart';

import './screens/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: HomeScreen(),
    );
  }
}
