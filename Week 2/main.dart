import 'package:flutter/material.dart';
import 'home.dart';
import 'expenses.dart';
import 'add_expenses.dart';
import 'list_of_data.dart';

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatefulWidget {
  const BudgetTrackerApp({super.key});

  @override
  _BudgetTrackerAppState createState() => _BudgetTrackerAppState();
}

class _BudgetTrackerAppState extends State<BudgetTrackerApp> {
  String userName = '';
  double totalAmount = 0;
  List<Item> data = [];

  void navigateToSecondScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddExpenseDialog(
        onExpenseAdded: addExpense,
        totalAmount: totalAmount,
      ),
    );
  }

  void addExpense(Item expense) {
    setState(() {
      data.add(expense);
      totalAmount += expense.amount;
    });
  }

  void deleteExpense(Item expense) {
    setState(() {
      data.remove(expense);
      totalAmount -= expense.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              totalAmount: totalAmount,
              navigateToSecondScreen: () => navigateToSecondScreen(context),
            ),
        '/expenses': (context) => Expenses(
              userName: userName,
              totalAmount: totalAmount,
              data: data,
              navigateToSecondScreen: () => navigateToSecondScreen(context),
              deleteExpense: deleteExpense,
            ),
      },
    );
  }
}
