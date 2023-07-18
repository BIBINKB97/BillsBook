import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/profile_model/user_model.dart';

class ProfileProviderClass with ChangeNotifier {
  UserModel? userData;
  int userDbId = 0;
  Future<void> addUser(UserModel value) async {
    final userDB = await Hive.openBox<UserModel>('UserDb');
    await userDB.put(userDbId, value);
    getUser();
  }

  Future getUser() async {
    final userDB = await Hive.openBox<UserModel>('UserDb');
    userData = userDB.get(userDbId);
    notifyListeners();
  }

  Future<void> editUser(UserModel updatedValue) async {
    final userDB = await Hive.openBox<UserModel>('UserDb');
    await userDB.put(userDbId, updatedValue);
    notifyListeners();
  }
}
