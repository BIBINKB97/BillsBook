import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/database/category_db/category_db.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListner,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return Expanded(
            child: newList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, indext) {
                      final Category = newList[indext];
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          title: Text(
                            (Category.name),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                CategoryDB.instance.deleteCategory(Category.id);
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: newList.length,
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                          child: Lottie.asset(
                            'images/noresults.json',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                        Text(
                          "No Categories Added yet!",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ));
      },
    );
  }
}
