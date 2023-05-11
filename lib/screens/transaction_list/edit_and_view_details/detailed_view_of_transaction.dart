import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';

import 'package:money_management_project/screens/transaction_list/edit_and_view_details/edit_transaction.dart';

class TransactionDetails extends StatelessWidget {
  TransactionModel data;

  TransactionDetails({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ' Details of Transaction',
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
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Color.fromARGB(210, 151, 52, 184),
                    Colors.white,
                  ],
                ),
              ),
              child: ListView(children: [
                Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 1.1,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(254, 250, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            leading: Icon(
                              Icons.currency_rupee,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: 30,
                            ),
                            title: RichText(
                              text: TextSpan(
                                  text: 'Amount : ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: data.amount.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                200, 151, 52, 184),
                                            fontSize: 16))
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            leading: Icon(
                              Icons.category,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: 30,
                            ),
                            title: RichText(
                              text: TextSpan(
                                  text: 'Category : ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: data.category.name,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                200, 151, 52, 184),
                                            fontSize: 16))
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            leading: Icon(
                              Icons.note,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: 30,
                            ),
                            title: RichText(
                              text: TextSpan(
                                  text: 'Description : ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: data.description,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                200, 151, 52, 184),
                                            fontSize: 16))
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            leading: Icon(
                              Icons.date_range,
                              color: Color.fromARGB(210, 151, 52, 184),
                              size: 30,
                            ),
                            title: RichText(
                              text: TextSpan(
                                  text: 'Date : ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: parseDate(data.date),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                200, 151, 52, 184),
                                            fontSize: 16))
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(200, 151, 52, 184))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditDetails(
                                  data: data,
                                ),
                              ));
                            },
                            child: Text(
                              'Edit Details',
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ])
              ]))
        ])));
  }

  String parseDate(DateTime date) {
    final formatter = DateFormat('d EEEE MMMM');
    return formatter.format(date);
  }
}
