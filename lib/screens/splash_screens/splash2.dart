import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 800), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNav()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("images/app_icon.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Text(
                "Bill's Book",
                style: GoogleFonts.exo(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: LinearProgressIndicator(),
            )
          ],
        ),
      )),
    );
  }
}
