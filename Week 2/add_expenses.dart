import 'package:flutter/material.dart';
import 'list_of_data.dart';

class AddExpenseDialog extends StatefulWidget {
  final Function(Item) onExpenseAdded;
  final double totalAmount;
  AddExpenseDialog(
      {Key? key, required this.onExpenseAdded, required this.totalAmount})
      : super(key: key);

  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Color.fromARGB(255, 42, 40, 40), // Set the background color to black
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Expense',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set the text color to white
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Category',
                labelStyle: TextStyle(
                    color: Colors.white), // Set the label color to white
              ),
              style:
                  TextStyle(color: Colors.white), // Set the text color to white
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                    color: Colors.white), // Set the label color to white
              ),
              keyboardType: TextInputType.number,
              style:
                  TextStyle(color: Colors.white), // Set the text color to white
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white), // Set the text color to white
                  ),
                ),
                TextButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    double amount =
                        double.tryParse(amountController.text) ?? 0.0;
                    double newTotalAmount = widget.totalAmount + amount;
                    if (newTotalAmount < 0) {
                      Navigator.pop(context);
                    } else if (name.isNotEmpty) {
                      Item expense = Item(category: name, amount: amount);
                      widget.onExpenseAdded(expense);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Add Expense',
                    style: TextStyle(
                        color: Colors.white), // Set the text color to white
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
