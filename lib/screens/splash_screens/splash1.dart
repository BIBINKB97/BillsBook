import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_project/screens/splash_screens/splash2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  bool _hasSeenSplash = false;

  @override
  void initState() {
    super.initState();
    _checkIfSeenSplash();
  }

  void _checkIfSeenSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;
    setState(() {
      _hasSeenSplash = hasSeenSplash;
    });
  }

  void _setHasSeenSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenSplash', true);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appNameFontSize = screenWidth * 0.14;
    final double imageContainerHeight = screenHeight * 0.45;
    final double imageContainerWidth = screenWidth * 0.9;
    final double headingFontSize = screenHeight * 0.04;
    final double buttonHeight = screenHeight * 0.05;
    final double buttonFontSize = screenHeight * 0.030;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Bill's Book",
                  style: GoogleFonts.exo(
                    fontSize: appNameFontSize,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(210, 151, 52, 184),
                  ),
                ),
              ),
              Container(
                height: imageContainerHeight,
                width: imageContainerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/1st.png"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: screenWidth * 0.09),
                child: RichText(
                  text: TextSpan(
                    text: "Let's\nManage",
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nMoney',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.048,
                          color: Color.fromARGB(210, 151, 52, 184),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: " With Us !",
                        style: TextStyle(
                          fontSize: headingFontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              MaterialButton(
                height: buttonHeight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                color: Color.fromARGB(210, 151, 52, 184),
                onPressed: () async {
                  _setHasSeenSplash();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Splash2()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
