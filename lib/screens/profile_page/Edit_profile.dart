import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_management_project/database/profile_db/profile_db.dart';
import 'package:money_management_project/model/profile_model/user_model.dart';

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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: Color.fromARGB(210, 151, 52, 184),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.9,
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
                            getUser();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(200, 151, 52, 184))),
                          child: Text(
                            '  Save  ',
                            style: TextStyle(fontSize: 17),
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
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      getUser();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Details added Successfully !",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
      );
      final user =
          UserModel(photo: _photo!.path, name: name, age: age, number: number);
      await addUser(user);
      Navigator.pop(context);
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
