import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:money_management_project/database/profile_db/profile_db.dart';
import 'package:money_management_project/screens/profile_page/Edit_profile.dart';
import 'package:money_management_project/screens/profile_page/about.dart';
import 'package:money_management_project/screens/profile_page/my_account.dart';
import 'package:money_management_project/screens/profile_page/privacy_policy.dart';
import 'package:money_management_project/screens/profile_page/reset_app.dart';
import 'package:money_management_project/screens/profile_page/terms_and_conditions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    getUser();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Color.fromARGB(210, 151, 52, 184),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.8,
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
              child: ListView(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: width * 0.84,
                          height: height * 0.17,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(254, 250, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: userData?.photo == null
                                    ? CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                            AssetImage("images/user.png"))
                                    : CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                            FileImage(File(userData!.photo))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: SizedBox(
                                  width: width * 0.35,
                                  child: Text(
                                    userData?.name ?? 'Edit Profile',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 05),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile()));
                                      },
                                      icon: Icon(Icons.edit))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: width * 0.84,
                          height: height * 0.53,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: ListTile(
                                  onTap: () async {
                                    await getUser();
                                    if (userData == null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfile(),
                                          ));
                                    } else {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MyAccount(),
                                      ));
                                    }
                                  },
                                  leading: Icon(
                                    Icons.account_circle,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: 35,
                                  ),
                                  title: Text(
                                    'My Account',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.privacy_tip,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: 35,
                                  ),
                                  title: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndConditions(),
                                    ));
                                  },
                                  leading: Icon(
                                    IconlyBold.document,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: 35,
                                  ),
                                  title: Text(
                                    'Terms And Conditions',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => AboutUs(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.android_rounded,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: 35,
                                  ),
                                  title: Text(
                                    'About',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ResetPage(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.restore,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: 35,
                                  ),
                                  title: Text(
                                    'Reset App',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
