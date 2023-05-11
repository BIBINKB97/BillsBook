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
            child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 400,
                  width: 450,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("images/1st.png"))),
                ),
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
                height: 35,
              ),
              MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                color: Color.fromARGB(210, 151, 52, 184),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BottomNav()));
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
          ),
        )),
      ),
    );
  }
  
}
