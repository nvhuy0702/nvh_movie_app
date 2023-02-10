import 'package:flutter/material.dart';
import 'package:nvh_movie_app/pages/on_boarding/screens/on_boarding_screen.dart';

import 'data/repository/top_rated_repository.dart';

void main() {
  TopRatedRepository().getUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreen(),
    );
  }
}
