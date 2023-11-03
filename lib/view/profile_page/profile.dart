import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:money_management_project/providers/profile_provider.dart';
import 'package:money_management_project/view/profile_page/Edit_profile.dart';
import 'package:money_management_project/view/profile_page/about.dart';
import 'package:money_management_project/view/profile_page/my_account.dart';
import 'package:money_management_project/view/profile_page/privacy_policy.dart';
import 'package:money_management_project/view/profile_page/reset_app.dart';
import 'package:money_management_project/view/profile_page/terms_and_conditions.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProviderClass>(context, listen: false).getUser();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w600),
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
                          height: height * 0.16,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(254, 250, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Consumer<ProfileProviderClass>(
                              builder: (context, profileProviderClass, _) {
                            return Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: profileProviderClass.userData?.photo ==
                                          null
                                      ? CircleAvatar(
                                          radius: 45,
                                          backgroundImage:
                                              AssetImage("images/user.png"))
                                      : CircleAvatar(
                                          radius: 45,
                                          backgroundImage: FileImage(File(
                                              profileProviderClass
                                                  .userData!.photo))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: SizedBox(
                                    width: width * 0.35,
                                    child: Text(
                                      profileProviderClass.userData?.name ??
                                          'Edit Profile',
                                      style: TextStyle(
                                          fontSize: width * 0.055,
                                          fontWeight: FontWeight.w500),
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
                            );
                          }),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: width * 0.84,
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Consumer<ProfileProviderClass>(builder:
                                    (context, profileProviderClass, _) {
                                  return ListTile(
                                    onTap: () async {
                                      await profileProviderClass.getUser();
                                      if (profileProviderClass.userData ==
                                          null) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfile(),
                                            ));
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => MyAccount(),
                                        ));
                                      }
                                    },
                                    leading: Icon(
                                      Icons.account_circle,
                                      color: Color.fromARGB(210, 151, 52, 184),
                                      size: width * 0.08,
                                    ),
                                    title: Text(
                                      'My Account',
                                      style: TextStyle(
                                          fontSize: width * 0.052,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
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
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
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
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Terms And Conditions',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                ),
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
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'About',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
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
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Reset App',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
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
