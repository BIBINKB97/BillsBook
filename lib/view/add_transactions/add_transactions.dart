// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';
import 'package:money_management_project/providers/category_provider.dart';
import 'package:money_management_project/providers/transaction_provider.dart';
import 'package:money_management_project/view/add_categories/add_categories.dart';
import 'package:intl/intl.dart';
import 'package:money_management_project/view/home_page/bottom_nav/bottom_nav.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _amountTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  void inistate() {
    Provider.of<CategoryProviderClass>(context, listen: false)
        .selectedCategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<TransactionProviderClass>(context, listen: false).refreshAll();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Transactions',
          style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Color.fromARGB(210, 151, 52, 184),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color.fromARGB(210, 151, 52, 184),
                  Colors.white,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: height * 0.06),
                  Center(
                      child: Text(
                    'Enter Amount',
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.095,
                      width: width * 0.40,
                      child: TextFormField(
                        controller: _amountTextEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            prefixIcon: Icon(
                              Icons.currency_rupee_rounded,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: width * 0.075,
                            )),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: width * 0.075,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<CategoryProviderClass>(
              builder: (context, categoryProviderClass, _) {
            return Row(
              children: [
                SizedBox(
                  width: width * 0.116,
                ),
                InkWell(
                  onTap: () {
                    categoryProviderClass.radioIncome();
                  },
                  child: Container(
                    height: height * 0.070,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Radio(
                            activeColor: Colors.white,
                            value: CategoryType.income,
                            groupValue:
                                categoryProviderClass.selectedCategorytype,
                            onChanged: (newValue) {
                              categoryProviderClass.radioIncome();
                            }),
                        Text(
                          "Income",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.059,
                ),
                InkWell(
                  onTap: () {
                    categoryProviderClass.radioExpence();
                  },
                  child: Container(
                    height: height * 0.070,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Radio(
                            activeColor: Colors.white,
                            value: CategoryType.expense,
                            groupValue:
                                categoryProviderClass.selectedCategorytype,
                            onChanged: (newValue) {
                              categoryProviderClass.radioExpence();
                            }),
                        Text(
                          "Expense",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: height * 0.03,
          ),
          Consumer<CategoryProviderClass>(
              builder: (context, categoryProviderClass, _) {
            return Row(
              children: [
                SizedBox(
                  width: width * 0.06,
                ),
                Container(
                  height: height * 0.075,
                  width: width * 0.415,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_add_circle,
                          size: 25,
                          color: Color.fromARGB(150, 151, 52, 184),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddCategories()));
                            },
                            child: Text(
                              'Add  Category',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.040,
                ),
                Container(
                  height: height * 0.075,
                  width: width * 0.415,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border:
                        Border.all(color: Colors.grey, width: width * 0.0025),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      underline: Container(),
                      hint: Text(
                        'Select Category',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.w600),
                      ),
                      value: Provider.of<CategoryProviderClass>(context,
                              listen: false)
                          .categoryID,
                      items: (categoryProviderClass.selectedCategorytype ==
                                  CategoryType.income
                              ? categoryProviderClass.incomeCategoryList
                              : categoryProviderClass.expenseCategoryList)
                          .map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: width * 0.052,
                                fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            categoryProviderClass.selectCategoryOntap(e);
                          },
                        );
                      }).toList(),
                      onChanged: (selectedValue) {
                        categoryProviderClass
                            .selectCategoryOnchanged(selectedValue!);
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  controller: _descriptionTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                      fontSize: width * 0.048, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Builder(builder: (context) {
                  return Consumer<CategoryProviderClass>(
                      builder: (context, categoryproviderclass, _) {
                    return TextButton.icon(
                        onPressed: () async {
                          final selectedDateTemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:
                                DateTime.now().subtract(Duration(days: 30)),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDateTemp == null) {
                            return;
                          } else {
                            categoryproviderclass.pickDate(selectedDateTemp);
                          }
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        label: Text(
                          categoryproviderclass.selectedDate == null
                              ? 'pick a date'
                              : DateFormat("dd-MMMM-yyyy")
                                  .format(categoryproviderclass.selectedDate!),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: width * 0.048,
                              fontWeight: FontWeight.w600),
                        ));
                  });
                }),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Column(children: [
            MaterialButton(
              height: height * 0.05,
              minWidth: width * 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Color.fromARGB(210, 151, 52, 184),
              onPressed: () {
                addTransaction();
              },
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: width * 0.050,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ])
        ]),
      ),
    );
  }

  Future<void> addTransaction() async {
    final amountText = _amountTextEditingController.text;
    final descriptionText = _descriptionTextEditingController.text;
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please enter an amount.',
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        ))),
      );
      return;
    }
    if (Provider.of<CategoryProviderClass>(context, listen: false).categoryID ==
        null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please select a category.',
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        ))),
      );
      return;
    }
    if (descriptionText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please enter a description.',
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        ))),
      );
      return;
    }

    if (Provider.of<CategoryProviderClass>(context, listen: false)
            .selectedCategoryModel ==
        null) {
      return;
    }
    if (Provider.of<CategoryProviderClass>(context, listen: false)
            .selectedDate ==
        null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please select a date.',
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        ))),
      );
      return;
    }

    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Please enter a valid amount.',
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        )),
      );
      return;
    }

    final model = TransactionModel(
        amount: parsedAmount,
        type: Provider.of<CategoryProviderClass>(context, listen: false)
            .selectedCategorytype!,
        category: Provider.of<CategoryProviderClass>(context, listen: false)
            .selectedCategoryModel!,
        description: descriptionText,
        date: Provider.of<CategoryProviderClass>(context, listen: false)
            .selectedDate!);

    await Provider.of<TransactionProviderClass>(context, listen: false)
        .addTransaction(model);
    Provider.of<TransactionProviderClass>(context, listen: false).refreshAll();

    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BottomNav(),
    ));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 5),
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Transaction added Successfully !",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
