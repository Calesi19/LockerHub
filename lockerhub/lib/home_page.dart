import 'package:flutter/material.dart';
import 'package:lockerhub/components/account_balance.dart';
import 'package:lockerhub/components/home_unit_button.dart';
import 'package:lockerhub/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: NavBar(),
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
            body: Column(children: [
              const SizedBox(height: 20),
              const Center(
                child: AccountBalanceWidget(balance: 2312),
              ),

              const SizedBox(height: 20),

              Row(children: const <Widget>[
                Expanded(
                    child: Divider(
                  indent: 40,
                  endIndent: 5,
                )),
                Text(
                  'RENTED UNITS',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  indent: 5,
                  endIndent: 45,
                )),
              ]),

              const SizedBox(height: 20),

              //UNITS  ///////////////////////

              const HomeUnitBlock(),

              const SizedBox(height: 20),

              const Divider(
                indent: 45,
                endIndent: 45,
              ),

              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(children: const [

                    Spacer(),
                    

                    Text(
                      'RENT A STORAGE SPACE',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),


                    Spacer(),
                    
                  ])),



            ])));
  }
}
