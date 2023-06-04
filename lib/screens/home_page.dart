import 'package:flutter/material.dart';
import 'package:yashu_client/screens/entry.dart';
import 'package:yashu_client/screens/view.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width * 0.50,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NewRecordsPage.routeName);
                  },
                  child: const Text('Add/Upload Client Records'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ViewScreenPage.routeName);
                  },
                  child: const Text('View Clients'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
