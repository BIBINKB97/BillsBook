import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  late final CategoryType type;

  @HiveField(2)
  final CategoryModel category;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  int? id;

  TransactionModel({
    required this.amount,
    required this.type,
    required this.category,
    required this.description,
    required this.date,
    this.id
  });
}
