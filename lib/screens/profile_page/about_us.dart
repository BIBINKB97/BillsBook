import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
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
          child: Column(children: const [
            Text(
              "Welcome to Bills Book, the easy-to-use app that helps you manage your money and achieve your financial goals. Here's a little bit about who we are and what we believe.\n\n1. Our Mission \n\nAt Bills Book, we believe that financial management should be simple and accessible to everyone. Our mission is to provide you with the tools you need to take control of your finances and achieve your financial goals, no matter what they are\n\n2.Our Team\n\n We're a small team of experienced developers and designers who are passionate about creating user-friendly, accessible financial tools. We know that managing money can be overwhelming, which is why we're committed to making Bills Book as easy and intuitive to use as possible\n\n 3. Our Values\n\nAt Bills Book, we believe in transparency, security, and privacy. We understand that financial information is sensitive, which is why we're committed to protecting your data and keeping your information safe and secure\n\n4. Get in Touch \n\nIf you have any questions or feedback about Bills Book, we'd love to hear from you! You can reach us at support@billsbook.com. Thank you for choosing Bills Book as your financial management tool !",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '\nDeveloped by Bibin K B',
              style: TextStyle(
                  fontSize: 17, color: Color.fromARGB(210, 151, 52, 184)),
            ),
          ]),
        ),
      ),
    );
  }
}
