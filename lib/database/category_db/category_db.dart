// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:money_management_project/model/category_model/category_model.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// abstract class CategoryDbFunctions {
//   Future<List<CategoryModel>> getCategories();
//   Future<void> insertCategory(CategoryModel value);
//   Future<void> deleteCategory(String categoryID);
// }

// class CategoryDB implements CategoryDbFunctions {
//   CategoryDB._internal();
//   static CategoryDB instance = CategoryDB._internal();

//   factory CategoryDB() {
//     return instance;
//   }

//   ValueNotifier<List<CategoryModel>> incomeCategoryListListner =
//       ValueNotifier([]);
//   ValueNotifier<List<CategoryModel>> expenseCategoryListListner =
//       ValueNotifier([]);

//   @override
//   Future<void> insertCategory(CategoryModel value) async {
//     final categoryDB = await Hive.openBox<CategoryModel>('category');
//     await categoryDB.put(value.id, value);
//     refreshUI();
//   }

//   @override
//   Future<List<CategoryModel>> getCategories() async {
//     final categoryDB = await Hive.openBox<CategoryModel>('category');
//     return categoryDB.values.toList();
//   }

//   Future<void> refreshUI() async {
//     final allCategories = await getCategories();
//     incomeCategoryListListner.value.clear();
//     expenseCategoryListListner.value.clear();

//     await Future.forEach(allCategories, (CategoryModel category) {
//       if (category.type == CategoryType.income) {
//         incomeCategoryListListner.value.add(category);
//       } else {
//         expenseCategoryListListner.value.add(category);
//       }
//     });

  
//     incomeCategoryListListner.notifyListeners();
//     expenseCategoryListListner.notifyListeners();
//   }

//   @override
//   Future<void> deleteCategory(String categoryID) async {
//     final categoryDB = await Hive.openBox<CategoryModel>('category');
//     await categoryDB.delete(categoryID);
//     refreshUI();
//   }
// }
