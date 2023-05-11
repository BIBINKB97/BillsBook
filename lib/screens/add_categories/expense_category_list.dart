import 'package:flutter/material.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/database/category_db/category_db.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListner,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return ListView.separated(
          itemBuilder: (context, indext) {
            final Category = newList[indext];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListTile(
                title: Text(
                  (Category.name),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                trailing:
                    IconButton(onPressed: () {
                       CategoryDB.instance.deleteCategory(Category.id);
                    }, icon: Icon(Icons.delete)),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }
}
