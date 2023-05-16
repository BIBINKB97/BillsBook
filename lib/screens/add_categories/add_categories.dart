import 'package:flutter/material.dart';
import 'package:money_management_project/database/category_db/category_db.dart';
import 'package:money_management_project/screens/add_categories/add_category_popup.dart';
import 'package:money_management_project/screens/add_categories/expense_category_list.dart';
import 'package:money_management_project/screens/add_categories/income_category_list.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  CategoryDB categoryDB = CategoryDB();
  @override
  void initState() {
    super.initState();
    categoryDB.refreshUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Category',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Color.fromARGB(200, 151, 52, 184),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          showCategoryAddPopup(context);
        },
        backgroundColor: Color.fromARGB(200, 151, 52, 184),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Color.fromARGB(200, 151, 52, 184),
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
                  TabBar(
                      indicatorColor: Color.fromRGBO(151, 52, 184, 0.784),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9 -
                        kToolbarHeight,
                    child: TabBarView(
                      children: const [
                        IncomeCategoryList(),
                        ExpenseCategoryList(),
                      ],
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
