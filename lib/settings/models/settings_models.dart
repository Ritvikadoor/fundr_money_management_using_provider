import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CategoryType type;
  @HiveField(4)
  final CategoryModel category;
  @HiveField(5)
  final String? purpose;

  TransactionModel({
    required this.id,
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final CategoryType type;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.type,
      this.isDeleted = false});

  @override
  String toString() {
    return '{$name ,$type}';
  }
}
