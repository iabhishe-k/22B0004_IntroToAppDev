// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  final double totalAmount;
  final Function() navigateToSecondScreen;

  Home({super.key, required this.totalAmount,required this.navigateToSecondScreen,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget Tracker',
          style: TextStyle(
              fontSize: 40.0,
              color: Color.fromARGB(255, 98, 4, 156),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 126, 219),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 180, 126, 219),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.person,
            size: 200.0,
          ),
          const Center(
            child: Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          const Center(
            child: Text(
              'BACK!',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
          const SizedBox(height: 80.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 5,
                    child: Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Row(
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            totalAmount.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          backgroundColor: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/expenses'),
                        child: const Icon(
                          Icons.expand_more,
                          color: Colors.black,
                          size: 24,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.pushNamed(context, '/expenses'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
