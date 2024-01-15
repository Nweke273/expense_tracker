import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {
  food,
  stipend,
  transport,
  airtime,
  subscription,
  miscellaneous,
  course
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.stipend: Icons.money,
  Category.transport: Icons.emoji_transportation,
  Category.airtime: Icons.phone,
  Category.subscription: Icons.phone_android,
  Category.miscellaneous: Icons.emoji_transportation,
  Category.course: Icons.book_outlined
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});
  // : id = uuid.v4();

  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
