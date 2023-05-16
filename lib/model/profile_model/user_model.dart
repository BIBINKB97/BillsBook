import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 4)
class UserModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String photo;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String number;
  UserModel(
      {required this.photo,
      required this.name,
      required this.age,
      required this.number,
      this.id = 0});
}
