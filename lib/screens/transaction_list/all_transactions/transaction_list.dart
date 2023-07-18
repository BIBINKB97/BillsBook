import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/providers/category_provider.dart';
import 'package:money_management_project/providers/transaction_provider.dart';
import 'package:money_management_project/screens/transaction_list/edit_and_view_details/detailed_view_of_transaction.dart';
import 'package:provider/provider.dart';

import '../../../model/transaction_model/transaction_model.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.white,
    size: 35,
  );

  Widget customSearchBar = const Text(
    "All Transactions",
    style: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
  );
  @override
  Widget build(BuildContext context) {
    Provider.of<TransactionProviderClass>(context, listen: false).refreshAll();
    Provider.of<CategoryProviderClass>(context, listen: false).refreshUI();
    return Consumer<TransactionProviderClass>(
        builder: (context, transactionProviderClass, _) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 238, 238),
        appBar: AppBar(
          centerTitle: true,
          title: customSearchBar,
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: Color.fromARGB(210, 151, 52, 184),
          actions: <Widget>[
            Consumer<TransactionProviderClass>(
                builder: (context, transactionProviderClass, _) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = Icon(
                        Icons.cancel,
                        color: Colors.white,
                      );
                      customSearchBar = TextField(
                        onChanged: (value) {
                          Provider.of<TransactionProviderClass>(context,
                                  listen: false)
                              .search(value);
                        },
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Search',
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      );
                    } else {
                      customIcon = Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.white,
                      );
                      customSearchBar = Text(
                        "All Transactions",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      );
                    }
                  });
                },
                child: SizedBox(
                  width: 100,
                  child: customIcon,
                ),
              );
            }),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromARGB(210, 151, 52, 184),
                Colors.white,
              ],
            ),
          ),
          child: Column(children: [
            Consumer<TransactionProviderClass>(
                builder: (context, transactionProviderClass, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          Provider.of<TransactionProviderClass>(context,
                                  listen: false)
                              .refreshAll();
                        },
                        child: const Text(
                          'All',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance.filter('Income');
                            transactionProviderClass.filter('Income');
                          },
                          child: const Text('Income',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance.filter('Expense');
                            transactionProviderClass.filter('Expense');
                          },
                          child: const Text('Expense',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance.filterDataByDate(
                            //   'All',
                            // );
                            transactionProviderClass.filterDataByDate('All');
                          },
                          child: const Text('All',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance.filterDataByDate(
                            //   'today',
                            // );
                            transactionProviderClass.filterDataByDate('today');
                          },
                          child: const Text('Today',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance.filterDataByDate(
                            //   'yesterday',
                            // );
                            transactionProviderClass
                                .filterDataByDate('yesterday');
                          },
                          child: const Text(
                            'yesterday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      PopupMenuItem(
                          onTap: () {
                            // transactionDB.instance
                            //     .filterDataByDate('last week');
                            transactionProviderClass
                                .filterDataByDate('last week');
                          },
                          child: const Text(
                            'last week',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              );
            }),
            Expanded(
              child: transactionProviderClass.transactionList.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        TransactionModel value =
                            transactionProviderClass.transactionList[index];
                        return Stack(
                          children: [
                            Slidable(
                              key: Key(value.id.toString()),
                              startActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Colors.transparent,
                                    onPressed: (ctx) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Alert !',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              content: Text(
                                                'Do you want to delete this transaction?',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'No',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      transactionProviderClass
                                                          .deleteTransaction(
                                                              value.id!);
                                                      // transactionDB.instance
                                                      //     .deleteTransaction(
                                                      //         value.id!);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ))
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  )
                                ],
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionDetails(
                                                  data: value,
                                                )));
                                  },
                                  title: Text(
                                    value.category.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    parseDate(value.date),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  trailing: Text(
                                    "₹ ${value.amount}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: value.type == CategoryType.income
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount:
                          transactionProviderClass.transactionList.length,
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          ColorFiltered(
                            colorFilter:
                                ColorFilter.mode(Colors.black, BlendMode.srcIn),
                            child: Lottie.asset(
                              'images/noresults.json',
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          Text(
                            "   No transactions yet !",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ]),
        ),
      );
    });
  }

  String parseDate(DateTime date) {
    final formatter = DateFormat('dd EE MMMM');
    return formatter.format(date);
  }
}
