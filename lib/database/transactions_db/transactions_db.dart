import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';

const transactionDbName = 'transactions';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(int id);
}

class transactionDB implements TransactionDbFunctions {
  transactionDB._internal();

  static transactionDB instance = transactionDB._internal();

  factory transactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    obj.id = await db.add(obj);
    db.put(obj.id, obj);
  }

  Future<void> refreshAll() async {
    final list = await getAllTransactions();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(list);
    transactionListNotifier.notifyListeners();
  }

  Future<void> editedTransaction(TransactionModel model) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    await db.put(model.id, model);
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(db.values);
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    return db.values.toList();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    await db.delete(id);
    refreshAll();
  }

  Future<void> search(String text) async {
    final transactionDB = await Hive.openBox<TransactionModel>('transactions');
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(transactionDB.values.where((element) =>
        element.category.name
            .toLowerCase()
            .trim()
            .contains(text.toLowerCase().trim())));
    transactionListNotifier.notifyListeners();
  }

  Future<List<TransactionModel>> accessTransactions() async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    return db.values.toList();
  }

  Future<void> filter(String text) async {
    if (text == 'Income') {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transactions');
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) => element.type == CategoryType.income)
          .toList());
      transactionListNotifier.notifyListeners();
    } else if (text == 'Expense') {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transactions');
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) => element.type == CategoryType.expense)
          .toList());
      transactionListNotifier.notifyListeners();
    } else {
      transactionListNotifier.notifyListeners();
    }
  }

  Future<void> filterDataByDate(String dateRange) async {
    final transactionDB = await Hive.openBox<TransactionModel>('transactions');
    if (dateRange == 'today') {
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) =>
              element.date.day == DateTime.now().day &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      transactionListNotifier.notifyListeners();
    } else if (dateRange == 'yesterday') {
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) =>
              element.date.day == DateTime.now().day - 1 &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      transactionListNotifier.notifyListeners();
    } else if (dateRange == 'last week') {
      final DateTime today = DateTime.now();
      final DateTime weekAgo = today.subtract(Duration(days: 7));

      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(
        transactionDB.values
            .where((element) =>
                element.date.isAfter(weekAgo) && element.date.isBefore(today))
            .toList(),
      );
      transactionListNotifier.notifyListeners();
    } else if (dateRange == 'All') {
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(transactionDB.values
          .where((element) =>
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      transactionListNotifier.notifyListeners();
    } else {
      transactionDB.values.toList();
    }
  }
}
