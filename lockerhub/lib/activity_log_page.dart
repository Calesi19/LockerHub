import 'package:flutter/material.dart';

class ActivityLogPage extends StatelessWidget {
  const ActivityLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('LOCKERHUB'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'lib/images/logo_white.png',
                width: 32,
                height: 32,
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.amber,
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(children: const [
                Spacer(),
                Text(
                  'ACTIVITY LOG',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Spacer(),
              ]),
            )
          ],
        ))));
  }
}
