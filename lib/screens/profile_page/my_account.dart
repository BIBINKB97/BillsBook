import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_management_project/database/profile_db/profile_db.dart';

class MyAccount extends StatelessWidget {
  final String name;
  final String age;
  final String number;
  final String photo;

  const MyAccount(
      {required this.photo,
      required this.name,
      required this.age,
      required this.number,
      super.key});

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Account',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
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
              child: ValueListenableBuilder(
                valueListenable: userListNotifier,
                builder: (context, value, child) {
                  return ListView(children: [
                    SafeArea(
                        child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: FileImage(File(photo)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        height: 300,
                        width: 350,
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
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: name,
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
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: age,
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
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: number,
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
