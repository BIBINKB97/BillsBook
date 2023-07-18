import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/category_model/category_model.dart';
import '../model/transaction_model/transaction_model.dart';

class TransactionProviderClass with ChangeNotifier {
  List<TransactionModel> transactionList = [];

  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    obj.id = await db.add(obj);
    db.put(obj.id, obj);
    notifyListeners();
  }

  Future<void> refreshAll() async {
    final list = await getAllTransactions();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionList.clear();
    transactionList.addAll(list);
    notifyListeners();
  }

  Future<void> editedTransaction(TransactionModel model) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    await db.put(model.id, model);
    transactionList.clear();
    transactionList.addAll(db.values);
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    return db.values.toList();
  } 

  Future<void> deleteTransaction(int id) async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    await db.delete(id);
    refreshAll();
  }

  Future<void> search(String text) async {
    final transactionDB = await Hive.openBox<TransactionModel>('transactions');
    transactionList.clear();
    transactionList.addAll(transactionDB.values.where((element) => element
        .category.name
        .toLowerCase()
        .trim()
        .contains(text.toLowerCase().trim())));
    notifyListeners();
  }

  Future<List<TransactionModel>> accessTransactions() async {
    final db = await Hive.openBox<TransactionModel>('transactions');
    return db.values.toList();
  }

  Future<void> filter(String text) async {
    if (text == 'Income') {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transactions');
      transactionList.clear();
      transactionList.addAll(transactionDB.values
          .where((element) => element.type == CategoryType.income)
          .toList());
      notifyListeners();
    } else if (text == 'Expense') {
      final transactionDB =
          await Hive.openBox<TransactionModel>('transactions');
      transactionList.clear();
      transactionList.addAll(transactionDB.values
          .where((element) => element.type == CategoryType.expense)
          .toList());
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future<void> filterDataByDate(String dateRange) async {
    final transactionDB = await Hive.openBox<TransactionModel>('transactions');
    if (dateRange == 'today') {
      transactionList.clear();
      transactionList.addAll(transactionDB.values
          .where((element) =>
              element.date.day == DateTime.now().day &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      notifyListeners();

    } else if (dateRange == 'yesterday') {
      transactionList.clear();
      transactionList.addAll(transactionDB.values
          .where((element) =>
              element.date.day == DateTime.now().day - 1 &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      notifyListeners();

    } else if (dateRange == 'last week') {
      final DateTime today = DateTime.now();
      final DateTime weekAgo = today.subtract(Duration(days: 7));
      transactionList.clear();
      transactionList.addAll(
        transactionDB.values
            .where((element) =>
                element.date.isAfter(weekAgo) && element.date.isBefore(today))
            .toList(),
      );
      notifyListeners();

    } else if (dateRange == 'All') {
      transactionList.clear();
      transactionList.addAll(transactionDB.values
          .where((element) =>
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList());
      notifyListeners();
      
    } else {
      transactionDB.values.toList();
    }
  }
}
