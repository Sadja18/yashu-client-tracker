import 'package:flutter/material.dart';
import 'package:yashu_client/screens/entry.dart';
import 'package:yashu_client/screens/home_page.dart';
import 'package:yashu_client/screens/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyschology Clients',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (ctx) => const HomePage(),
        NewRecordsPage.routeName: (context) => const NewRecordsPage(),
        ViewScreenPage.routeName: (context) => const ViewScreenPage()
      },
    );
  }
}
