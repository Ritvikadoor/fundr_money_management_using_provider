import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
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
