import 'package:flutter/material.dart';
import 'package:lockerhub/components/my_button.dart';
import 'package:lockerhub/components/my_textfield.dart';
import 'package:lockerhub/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 50),

            //logo
            Image.asset(
              'lib/images/lockerhub_black.png',
              width: 175,
              height: 175,
            ),

            const SizedBox(height: 50),

            //Welcome text
            const Text(
              'Welcome back you\'ve been missed!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            //username login

            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),
            //password login
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),
            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            //sign in button
            MyButton(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage())))
          ],
        ))));
  }
}
