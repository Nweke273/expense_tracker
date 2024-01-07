import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 5000,
        date: DateTime.now(),
        category: Category.course),
    Expense(
        title: 'Airtel Subscription',
        amount: 3000,
        date: DateTime.now(),
        category: Category.subscription)
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("My Expense Tracker", textAlign: TextAlign.center)],
    ));
  }
}
