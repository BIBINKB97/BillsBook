import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/database/profile_db/profile_db.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/profile_model/user_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';
import 'package:money_management_project/screens/home_page/balance/balance.dart';
import 'package:money_management_project/screens/splash_screens/splash1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Reset App',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: Color.fromARGB(210, 151, 52, 184),
        ),
        body: Center(
          child: Container(
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Lottie.asset('images/reset.json'),
                ),
                SizedBox(height: 20),
                Text(
                  'This action cannot be undone and\n     you will lose all of your data.!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Alert ! ',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  content: Text(
                                    'Do you want to reset the entire data?',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.clear();
                                          SharedPreferences textcontrol =
                                              await SharedPreferences
                                                  .getInstance();
                                          await textcontrol.clear();
                                          final transationDb = await Hive
                                              .openBox<TransactionModel>(
                                                  'transactions');
                                          final categorydb =
                                              await Hive.openBox<CategoryModel>(
                                                  'category');
                                          final userDB =
                                              await Hive.openBox<UserModel>(
                                                  'UserDb');

                                          categorydb.clear();
                                          transationDb.clear();
                                          userDB.clear();
                                          userData = null;

                                          incomeNotifier = ValueNotifier(0);
                                          expenseNotifier = ValueNotifier(0);
                                          totalNotifier = ValueNotifier(0);

                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                const Splash1(),
                                          ));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red),
                                        ))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'Reset ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
