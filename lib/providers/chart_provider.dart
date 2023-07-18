import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_project/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

import '../model/category_model/category_model.dart';
import '../model/transaction_model/transaction_model.dart';

class ChartProviderClass with ChangeNotifier {
 

  String today = DateFormat.yMd().format(
    DateTime.now(),
  );
  String yesterday = DateFormat.yMd().format(
    DateTime.now().subtract(
      const Duration(days: 1),
    ),
  );

  filterFunction(BuildContext context) async {
    final list =
        await Provider.of<TransactionProviderClass>(context, listen: false)
            .accessTransactions();
    overviewNotifier.clear();
    incomeNotifier1.clear();
    expenseNotifier1.clear();
    todayNotifier.clear();
    yesterdayNotifier.clear();
    incomeTodayNotifier.clear();
    incomeYesterdayNotifier.clear();
    expenseTodayNotifier.clear();
    expenseYesterdayNotifier.clear();
    lastWeekNotifier.clear();
    expenseLastWeekNotifier.clear();
    incomeLastWeekNotifier.clear();
    lastMonthNotifier.clear();
    expenseLastMonthNotifier.clear();
    incomeLastMonthNotifier.clear();

    for (var element in list) {
      if (element.category.type == CategoryType.income) {
        incomeNotifier1.add(element);
      } else if (element.category.type == CategoryType.expense) {
        expenseNotifier1.add(element);
      }

      overviewNotifier.add(element);
    }

    for (var element in list) {
      String elementDate = DateFormat.yMd().format(element.date);
      if (elementDate == today) {
        todayNotifier.add(element);
      }

      if (elementDate == yesterday) {
        yesterdayNotifier.add(element);
      }
      if (element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      )) {
        lastWeekNotifier.add(element);
      }

      if (element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 30),
        ),
      )) {
        lastMonthNotifier.add(element);
      }

      if (elementDate == today && element.type == CategoryType.income) {
        incomeTodayNotifier.add(element);
      }

      if (elementDate == yesterday && element.type == CategoryType.income) {
        incomeYesterdayNotifier.add(element);
      }

      if (elementDate == today && element.type == CategoryType.expense) {
        expenseTodayNotifier.add(element);
      }

      if (elementDate == yesterday && element.type == CategoryType.expense) {
        expenseYesterdayNotifier.add(element);
      }
      if (element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ) &&
          element.type == CategoryType.income) {
        incomeLastWeekNotifier.add(element);
      }

      if (element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ) &&
          element.type == CategoryType.expense) {
        expenseLastWeekNotifier.add(element);
      }

      if (element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 30),
            ),
          ) &&
          element.type == CategoryType.income) {
        incomeLastMonthNotifier.add(element);
      }

      if (element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 30),
            ),
          ) &&
          element.type == CategoryType.expense) {
        expenseLastMonthNotifier.add(element);
      }
    }

    notifyListeners();
  }
}
 List<TransactionModel> overviewNotifier = [];
  List<TransactionModel> incomeNotifier1 = [];

  List<TransactionModel> expenseNotifier1 = [];

  List<TransactionModel> todayNotifier = [];

  List<TransactionModel> yesterdayNotifier = [];

  List<TransactionModel> incomeTodayNotifier = [];

  List<TransactionModel> incomeYesterdayNotifier = [];

  List<TransactionModel> expenseTodayNotifier = [];

  List<TransactionModel> expenseYesterdayNotifier = [];
  List<TransactionModel> lastWeekNotifier = [];

  List<TransactionModel> incomeLastWeekNotifier = [];

  List<TransactionModel> expenseLastWeekNotifier = [];

  List<TransactionModel> lastMonthNotifier = [];

  List<TransactionModel> incomeLastMonthNotifier = [];

  List<TransactionModel> expenseLastMonthNotifier = [];