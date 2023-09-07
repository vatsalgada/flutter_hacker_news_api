import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'News',
      home: NewsList()
    );
  }
}