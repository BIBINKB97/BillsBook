import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/database/transactions_db/transactions_db.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';
import 'package:money_management_project/screens/transaction_list/edit_and_view_details/detailed_view_of_transaction.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: transactionDB.instance.transactionListNotifier,
      builder:
          (BuildContext context, List<TransactionModel> newList, Widget? _) {
        return Expanded(
            child: newList.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      final value = newList[index];
                      return Card(
                        elevation: 0,
                        color: Color.fromARGB(255, 233, 233, 233),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransactionDetails(
                                      data: value,
                                    )));
                          },
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: value.type == CategoryType.income
                                ? Colors.green
                                : Colors.red,
                            child: value.type == CategoryType.income
                                ? Icon(
                                    Icons.arrow_upward,
                                    size: 28,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.arrow_downward,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                          ),
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
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: value.type == CategoryType.income
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                    itemCount: newList.length > 4 ? 4 : newList.length,
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          child: Lottie.asset(
                            'images/noresults.json',
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        Text(
                          "  No transactions yet !",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }

  String parseDate(DateTime date) {
    final date1 = DateFormat.MMMMEEEEd().format(date);
    final splitedDate = date1.split(' ');
    return "${splitedDate.last} ${splitedDate.first}";
  }
}
