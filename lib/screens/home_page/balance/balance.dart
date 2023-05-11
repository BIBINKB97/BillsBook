import 'package:flutter/material.dart';
import 'package:money_management_project/database/transactions_db/add_transactions_db.dart';
import 'package:money_management_project/model/category_model/category_model.dart';

ValueNotifier<double> incomeNotifier = ValueNotifier(0);
ValueNotifier<double> expenseNotifier = ValueNotifier(0);
ValueNotifier<double> totalNotifier = ValueNotifier(0);

Future<void> balanceAmount() async {
  await transactionDB.instance.getAllTransactions().then((value) {
    expenseNotifier.value = 0;
    incomeNotifier.value = 0;
    totalNotifier.value = 0;

    for (var item in value) {
      if (item.type == CategoryType.income) {
        incomeNotifier.value += item.amount;
      } else {
        expenseNotifier.value += item.amount;
      }
    }
    totalNotifier.value = incomeNotifier.value - expenseNotifier.value;
  });
}
