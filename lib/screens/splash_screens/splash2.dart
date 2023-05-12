import 'package:flutter/material.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_project/screens/splash_screens/splash1.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.057,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Bill's Book",
                style: GoogleFonts.exo(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(210, 151, 52, 184)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/2nd.png"),
              )),
            ),
            Text(
              "Enter  Name",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(210, 151, 52, 184),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            MaterialButton(
              height: MediaQuery.of(context).size.height * 0.055,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Color.fromARGB(210, 151, 52, 184),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Splash1()));
              },
              child: Text(
                'Continue',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                  child: Text(
                    'Skip >>',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
