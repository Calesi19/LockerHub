import 'package:flutter/material.dart';
import 'package:lockerhub/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
                backgroundColor: Colors.black, title: const Text('LOCKERHUB')),
            body: Column(
              children: const [Text("Hey")],
            )));
  }
}
