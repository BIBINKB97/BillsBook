import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_management_project/database/profile_db/profile_db.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    getUser();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Account',
            style: TextStyle(
                fontSize: width * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: Color.fromARGB(210, 151, 52, 184),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.9,
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
              child: ValueListenableBuilder(
                valueListenable: userListNotifier,
                builder: (context, value, child) {
                  return ListView(children: [
                    SafeArea(
                        child: Column(children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: FileImage(File(userData!.photo)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        width: width * 0.86,
                        height: height * 0.35,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Color.fromARGB(210, 151, 52, 184),
                                  size: 30,
                                ),
                                title: RichText(
                                  text: TextSpan(
                                      text: 'Name : ',
                                      style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: userData?.name,
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
                                  Icons.cake,
                                  color: Color.fromARGB(210, 151, 52, 184),
                                  size: 30,
                                ),
                                title: RichText(
                                  text: TextSpan(
                                      text: 'Age : ',
                                      style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: userData?.age,
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
                                  Icons.phone,
                                  color: Color.fromARGB(210, 151, 52, 184),
                                  size: 30,
                                ),
                                title: RichText(
                                  text: TextSpan(
                                      text: 'Number : ',
                                      style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: userData?.number,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    200, 151, 52, 184),
                                                fontSize: 16))
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]))
                  ]);
                },
              ))
        ])));
  }
}
