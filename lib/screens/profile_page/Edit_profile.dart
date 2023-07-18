import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_management_project/model/profile_model/user_model.dart';
import 'package:money_management_project/providers/profile_provider.dart';
import 'package:money_management_project/screens/home_page/bottom_nav/bottom_nav.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameOfUser = TextEditingController();
  final _ageOfUser = TextEditingController();
  final _numberOfUser = TextEditingController();
  bool imageAlert = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: width * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: Color.fromARGB(210, 151, 52, 184),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: height * 0.9,
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
              child: ListView(children: [
                Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  _photo?.path == null
                      ? CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage("images/user.png"),
                        )
                      : CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(File(
                            _photo!.path,
                          )),
                        )
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      getPhoto();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(200, 151, 52, 184))),
                    child: Text('Add photo', style: TextStyle(fontSize: 17)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameOfUser,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.031,
                        ),
                        TextFormField(
                          controller: _ageOfUser,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Age',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013,
                        ),
                        TextFormField(
                          controller: _numberOfUser,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Number',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onSaveButton();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(200, 151, 52, 184))),
                          child: Text(
                            '  Save  ',
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]))
        ])));
  }

  Future<void> onSaveButton() async {
    final name = _nameOfUser.text.toString();
    final age = _ageOfUser.text.toString();
    final number = _numberOfUser.text.toString();
    if (name.isEmpty || age.isEmpty || number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Please fill in all fields !",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.052),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final user =
          UserModel(photo: _photo!.path, name: name, age: age, number: number);
      await Provider.of<ProfileProviderClass>(context, listen: false)
          .addUser(user);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Details added Successfully !",
            style:
                // ignore: use_build_context_synchronously
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.052),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  File? _photo;
  Future<void> getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
    } else {
      final tempPhoto = File(photo.path);
      setState(() {
        _photo = tempPhoto;
      });
    }
  }
}
