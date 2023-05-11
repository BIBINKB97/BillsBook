import 'package:flutter/material.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 400,
                  width: 450,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/2nd.png"),
                  )),
                ),
              ),
              Text(
                "Enter  Name",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(210, 151, 52, 184),
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 330,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              SizedBox(
                height: 20,
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
                  'Continue',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
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
        ),
      )),
    );
  }
}
