// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:money_management_project/model/category_model/category_model.dart';
// import 'package:money_management_project/model/transaction_model/transaction_model.dart';
// import 'package:money_management_project/providers/transaction_provider.dart';
// import 'package:provider/provider.dart';

// List<TransactionModel> overviewNotifier = [];
// List<TransactionModel> incomeNotifier1 = [];

// List<TransactionModel> expenseNotifier1 = [];

// List<TransactionModel> todayNotifier = [];

// List<TransactionModel> yesterdayNotifier = [];

// List<TransactionModel> incomeTodayNotifier = [];

// List<TransactionModel> incomeYesterdayNotifier = [];

// List<TransactionModel> expenseTodayNotifier = [];

// List<TransactionModel> expenseYesterdayNotifier = [];
// List<TransactionModel> lastWeekNotifier = [];

// List<TransactionModel> incomeLastWeekNotifier = [];

// List<TransactionModel> expenseLastWeekNotifier = [];

// List<TransactionModel> lastMonthNotifier = [];

// List<TransactionModel> incomeLastMonthNotifier = [];

// List<TransactionModel> expenseLastMonthNotifier = [];

// String today = DateFormat.yMd().format(
//   DateTime.now(),
// );
// String yesterday = DateFormat.yMd().format(
//   DateTime.now().subtract(
//     const Duration(days: 1),
//   ),
// );

// filterFunction(BuildContext context) async {
//   final list =
//       await Provider.of<TransactionProviderClass>(context, listen: false)
//           .accessTransactions();
//   overviewNotifier.value.clear();
//   incomeNotifier1.value.clear();
//   expenseNotifier1.value.clear();
//   todayNotifier.value.clear();
//   yesterdayNotifier.value.clear();
//   incomeTodayNotifier.value.clear();
//   incomeYesterdayNotifier.value.clear();
//   expenseTodayNotifier.value.clear();
//   expenseYesterdayNotifier.value.clear();
//   lastWeekNotifier.value.clear();
//   expenseLastWeekNotifier.value.clear();
//   incomeLastWeekNotifier.value.clear();
//   lastMonthNotifier.value.clear();
//   expenseLastMonthNotifier.value.clear();
//   incomeLastMonthNotifier.value.clear();

//   for (var element in list) {
//     if (element.category.type == CategoryType.income) {
//       incomeNotifier1.value.add(element);
//     } else if (element.category.type == CategoryType.expense) {
//       expenseNotifier1.value.add(element);
//     }

//     overviewNotifier.value.add(element);
//   }

//   for (var element in list) {
//     String elementDate = DateFormat.yMd().format(element.date);
//     if (elementDate == today) {
//       todayNotifier.value.add(element);
//     }

//     if (elementDate == yesterday) {
//       yesterdayNotifier.value.add(element);
//     }
//     if (element.date.isAfter(
//       DateTime.now().subtract(
//         const Duration(days: 7),
//       ),
//     )) {
//       lastWeekNotifier.value.add(element);
//     }

//     if (element.date.isAfter(
//       DateTime.now().subtract(
//         const Duration(days: 30),
//       ),
//     )) {
//       lastMonthNotifier.value.add(element);
//     }

//     if (elementDate == today && element.type == CategoryType.income) {
//       incomeTodayNotifier.value.add(element);
//     }

//     if (elementDate == yesterday && element.type == CategoryType.income) {
//       incomeYesterdayNotifier.value.add(element);
//     }

//     if (elementDate == today && element.type == CategoryType.expense) {
//       expenseTodayNotifier.value.add(element);
//     }

//     if (elementDate == yesterday && element.type == CategoryType.expense) {
//       expenseYesterdayNotifier.value.add(element);
//     }
//     if (element.date.isAfter(
//           DateTime.now().subtract(
//             const Duration(days: 7),
//           ),
//         ) &&
//         element.type == CategoryType.income) {
//       incomeLastWeekNotifier.value.add(element);
//     }

//     if (element.date.isAfter(
//           DateTime.now().subtract(
//             const Duration(days: 7),
//           ),
//         ) &&
//         element.type == CategoryType.expense) {
//       expenseLastWeekNotifier.value.add(element);
//     }

//     if (element.date.isAfter(
//           DateTime.now().subtract(
//             const Duration(days: 30),
//           ),
//         ) &&
//         element.type == CategoryType.income) {
//       incomeLastMonthNotifier.value.add(element);
//     }

//     if (element.date.isAfter(
//           DateTime.now().subtract(
//             const Duration(days: 30),
//           ),
//         ) &&
//         element.type == CategoryType.expense) {
//       expenseLastMonthNotifier.value.add(element);
//     }
//   }

//   overviewNotifier.notifyListeners();
//   todayNotifier.notifyListeners();
//   yesterdayNotifier.notifyListeners();
//   incomeNotifier1.notifyListeners();
//   expenseNotifier1.notifyListeners();
//   incomeTodayNotifier.notifyListeners();
//   incomeYesterdayNotifier.notifyListeners();
//   expenseTodayNotifier.notifyListeners();
//   expenseYesterdayNotifier.notifyListeners();
//   lastWeekNotifier.notifyListeners();
//   incomeLastWeekNotifier.notifyListeners();
//   expenseLastWeekNotifier.notifyListeners();
//   lastMonthNotifier.notifyListeners();
//   incomeLastMonthNotifier.notifyListeners();
//   expenseLastMonthNotifier.notifyListeners();
// }
