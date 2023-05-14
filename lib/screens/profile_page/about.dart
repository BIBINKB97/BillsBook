import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Color.fromARGB(210, 151, 52, 184),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'BillsBook',
                      style: GoogleFonts.amiko(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(210, 151, 52, 184),
                          fontSize: 20)),
                  TextSpan(
                      text:
                          "   is a money management app designed to help you track your expenses, create budgets, and achieve your financial goals. With our easy-to-use interface and powerful tools, you can take control of your finances and make informed decisions about your money.\n\nThis app is perfect for individuals and families who want to stay on top of their finances and make informed decisions about their money. Whether you're trying to save up for a big purchase or just looking to get a better handle on your day-to-day expenses, 'BillsBook' has you covered.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Text(
              'Developed by Bibin KB',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(210, 151, 52, 184),
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
      ),
    );
  }
}
