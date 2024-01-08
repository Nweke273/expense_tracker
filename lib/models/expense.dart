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
