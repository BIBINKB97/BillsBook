import 'package:flutter/material.dart';

import 'package:money_management_project/database/category_db/category_db.dart';
import 'package:money_management_project/database/transactions_db/transactions_db.dart';

import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';
import 'package:money_management_project/screens/add_categories/add_categories.dart';
import 'package:intl/intl.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';

// ignore: must_be_immutable
class EditDetails extends StatefulWidget {
  TransactionModel data;

  EditDetails({super.key, required this.data});

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  transactionDB transactiondB = transactionDB();
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  final TextEditingController _amountTextEditingController =
      TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategorytype = widget.data.type;
    _selectedDate = widget.data.date;
    _amountTextEditingController.text = widget.data.amount.toString();
    _descriptionTextEditingController.text = widget.data.description;
    super.initState();
    CategoryDB categoryDB = CategoryDB();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Details',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
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
                  SizedBox(height: height * 0.07),
                  Center(
                      child: Text(
                    'Enter Amount',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(210, 151, 52, 184)),
                  )),
                  SizedBox(
                    height: height * 0.03,
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
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            prefixIcon: Icon(
                              Icons.currency_rupee_rounded,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: 30,
                            )),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.116,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.data.type = CategoryType.income;
                    _selectedCategorytype = CategoryType.income;
                    // _categoryID = null;
                  });
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
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = newValue;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Income",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                  setState(() {
                    widget.data.type = CategoryType.expense;
                    _selectedCategorytype = CategoryType.expense;
                    _categoryID = null;
                  });
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
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = newValue;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Expense",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
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
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      widget.data.category.name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    value: _categoryID,
                    items: (_selectedCategorytype == CategoryType.income
                            ? CategoryDB().incomeCategoryListListner
                            : CategoryDB().expenseCategoryListListner)
                        .value
                        .map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(
                          e.name,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          _selectedCategoryModel = e;
                        },
                      );
                    }).toList(),
                    onChanged: (selectedValue) {
                      setState(() {
                        _categoryID = selectedValue;
                      });
                    },
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
                        size: 30,
                        color: Color.fromARGB(150, 151, 52, 184),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddCategories()));
                          },
                          child: Text(
                            'New Category',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                child: TextButton.icon(
                    onPressed: () async {
                      final selectedDateTemp = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 30)),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDateTemp == null) {
                        return;
                      } else {
                        setState(() {
                          _selectedDate = selectedDateTemp;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.black54,
                    ),
                    label: Text(
                      _selectedDate == null
                          ? 'pick a date'
                          : DateFormat("dd-MMMM-yyyy").format(_selectedDate!),
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Column(children: [
            MaterialButton(
              height: 50,
              minWidth: 120,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Color.fromARGB(210, 151, 52, 184),
              onPressed: () {
                EditedTansaction();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomNav(),
                ));
              },
              child: Text(
                'Save Changes',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ])
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> EditedTansaction() async {
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
    if (_categoryID == null) {
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

    if (_selectedCategoryModel == null) {
      return;
    }
    if (_selectedDate == null) {
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
      return;
    }

    final model = TransactionModel(
        amount: parsedAmount,
        type: _selectedCategorytype!,
        category: _selectedCategoryModel ?? widget.data.category,
        description: descriptionText,
        date: _selectedDate!,
        id: widget.data.id);

    await transactionDB.instance.editedTransaction(model);
    transactionDB.instance.refreshAll();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 42),
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Changes Saved Successfully !",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
