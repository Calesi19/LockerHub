import 'package:flutter/material.dart';

class AccountBalanceWidget extends StatelessWidget {
  final double balance;

  const AccountBalanceWidget({Key? key, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: const Color.fromRGBO(44, 164, 255, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Balance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50.0,
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => print('make payment'),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(child: Text('Make Payment'))),
            )
          ],
        ),
      ),
    );
  }
}
