import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';
import 'package:money_management_project/screens/splash_screens/splash2.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  image: DecorationImage(image: AssetImage("images/1st.png"))),
            ),
            Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 40),
                child: RichText(
                  text: TextSpan(
                      text: "Let's\nManage",
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '\nMoney',
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(210, 151, 52, 184),
                              fontWeight: FontWeight.w800),
                        ),
                        TextSpan(
                          text: " With Us !",
                          style: TextStyle(
                              fontSize: 33,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            MaterialButton(
              height: MediaQuery.of(context).size.height * 0.055,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Color.fromARGB(210, 151, 52, 184),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Splash2()));
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
