import 'package:flutter/material.dart';
import 'package:lockerhub/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {

  // Initialize connection to Firebase Database for Authentication.
  // App will not work without this initialized first.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Entire app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const WidgetTree(),
    );
  }
}






