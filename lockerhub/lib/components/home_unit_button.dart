import 'package:flutter/material.dart';
import 'package:lockerhub/locker_page.dart';

class HomeUnitBlock extends StatelessWidget {
  const HomeUnitBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LockerPage()))
                },
      child: Container(
          
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.amber,
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
          child: Row(children: [
            const Text(
              '241',
              style: TextStyle(fontSize: 65),
            ),
            Spacer(),
            Column(children: const [
              Text('Birch Lane'),
              Text('Woodbury, Minnesota'),
              Text(
                'SIZE: MEDIUM',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ]),
            const Spacer(),
            Column(
              children: const [
                Icon(
                  Icons.lock,
                  size: 60,
                ),
                Text('Access')
              ],
            )
          ])),
    );
  }
}
