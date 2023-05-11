import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:money_management_project/model/profile_model/user_model.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

Future<void> addUser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('UserDb');
   userDB.put(value.id,value);
  
}

Future<void> getUser() async {
  final userDB = await Hive.openBox<UserModel>('userDb');
  userListNotifier.value.clear();
  userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

Future<void> editUser(UserModel model) async {
  final userDB = await Hive.openBox<UserModel>('UserDb');
   await userDB.put(model.id,model);

}
