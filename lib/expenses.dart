import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_list.dart';
import 'package:expense_tracker/widgets/expenses/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => (NewExpense(onAddExpense: _addExpense)));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    _registeredExpenses.remove(expense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('2024 Expense Tracker'),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          children: [
            const Text("My Expense Tracker2"),
            Expanded(
                child: ExpenseList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ))
          ],
        ));
  }
}
