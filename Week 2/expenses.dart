// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'list_of_data.dart';

class Expenses extends StatelessWidget {
  final String userName;
  final double totalAmount;
  List<Item> data;
  final Function() navigateToSecondScreen;
  final Function(Item) deleteExpense;

  Expenses({
    super.key,
    required this.userName,
    required this.totalAmount,
    required this.data,
    required this.navigateToSecondScreen,
    required this.deleteExpense,
  });

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
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
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
                      "Total",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
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
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        child: const Icon(
                          Icons.expand_less,
                          color: Colors.black,
                          size: 24,
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Item expense = data[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${expense.category}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Row(
                              children: [
                                const Text(
                                  '\$',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  expense.amount.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteExpense(expense),
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToSecondScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
