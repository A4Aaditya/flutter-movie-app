import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movie App',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0.0),
      ),
      home: const SplashScreen(),
    );
  }
}
