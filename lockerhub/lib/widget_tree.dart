import 'package:lockerhub/auth.dart';
import 'package:lockerhub/pages/home_page.dart';
import 'package:lockerhub/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          //return HomePage(); // Comment this out when deploying app. Include it when coding to avoid having to sign in everytime. 
          return const LoginPage(); // Comment this out when working on the app.
        }
      },
    );
  }
}
