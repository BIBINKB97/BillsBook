import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_project/screens/home_page/balance/balance.dart';
import 'package:money_management_project/database/transactions_db/add_transactions_db.dart';
import 'package:money_management_project/screens/home_page/recent_transactions/recent.dart';
import 'package:money_management_project/screens/transaction_list/all_transactions/transaction_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    transactionDB.instance.refreshAll();
    balanceAmount();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color.fromARGB(250, 151, 52, 184),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    DateFormat('EEEE d\nMMMM').format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ValueListenableBuilder(
                      valueListenable: totalNotifier,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '₹ ${totalNotifier.value.toString()}',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.029,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height:
                                  MediaQuery.of(context).size.height * 0.056,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white),
                              child: Icon(
                                Icons.unarchive,
                                color: Colors.green,
                                size: 35,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: incomeNotifier,
                                      builder: (context, value, child) {
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.23,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          child: Text(
                                            '₹${incomeNotifier.value.toString()}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.029,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height:
                                  MediaQuery.of(context).size.height * 0.056,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white),
                              child: Icon(
                                Icons.archive,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expense',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: expenseNotifier,
                                      builder: (context, value, child) {
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.23,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          child: Text(
                                            '₹${expenseNotifier.value.toString()}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Color.fromARGB(250, 151, 52, 184),
                            )))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionList()));
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                      color: Color.fromARGB(210, 151, 52, 184),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Recent(),
        ],
      ),
    );
  }
}
