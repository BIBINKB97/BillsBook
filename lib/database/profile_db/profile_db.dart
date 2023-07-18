// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:money_management_project/model/profile_model/user_model.dart';

// UserModel? userData;
// ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);
// int userDbId = 0;
// Future<void> addUser(UserModel value) async {
//   final userDB = await Hive.openBox<UserModel>('UserDb');
//   await userDB.put(userDbId, value);
//   getUser();
// }

// Future getUser() async {
//   final userDB = await Hive.openBox<UserModel>('UserDb');
//   userData = userDB.get(userDbId);
// }

// Future<void> editUser(UserModel updatedValue) async {
//   final userDB = await Hive.openBox<UserModel>('UserDb');
//   await userDB.put(userDbId, updatedValue);
// }
