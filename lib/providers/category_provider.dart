import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/category_model/category_model.dart';

class CategoryProviderClass with ChangeNotifier {
  CategoryType? selectedCategorytype;
  CategoryModel? selectedCategoryModel;
  String? categoryID;
  DateTime? selectedDate;

  List<CategoryModel> incomeCategoryList = [];
  List<CategoryModel> expenseCategoryList = [];

  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>('category');
    await categoryDB.put(value.id, value);
    refreshUI();
  }

  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>('category');
    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final allCategories = await getCategories();
    
    incomeCategoryList.clear();
    expenseCategoryList.clear();
    notifyListeners();
    await Future.forEach(allCategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategoryList.add(category);
      } else {
        expenseCategoryList.add(category);
      }
    });

    notifyListeners();
  }

  Future<void> deleteCategory(String categoryID) async {
    final categoryDB = await Hive.openBox<CategoryModel>('category');
    await categoryDB.delete(categoryID);
    refreshUI();
  }

  void radioIncome() {
    selectedCategorytype = CategoryType.income;
    categoryID = null;
    notifyListeners();
  }

  void radioExpence() {
    selectedCategorytype = CategoryType.expense;
    categoryID = null;
    notifyListeners();
  }

  void selectCategoryOnchanged(String selectedValue) {
    categoryID = selectedValue;
    notifyListeners();
  }

  void selectCategoryOntap(CategoryModel? e) {
    selectedCategoryModel = e;
    notifyListeners();
  }

  void pickDate(selectedDateTemp) {
    selectedDate = selectedDateTemp;
    notifyListeners();
  }
}
