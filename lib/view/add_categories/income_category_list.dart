import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/providers/category_provider.dart';
import 'package:provider/provider.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<CategoryProviderClass>(
      builder: (context, categoryProviderClass, _) {
        return categoryProviderClass.incomeCategoryList.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, indext) {
                  final Category =
                      categoryProviderClass.incomeCategoryList[indext];

                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      title: Text(
                        (Category.name),
                        style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            // CategoryDB.instance.deleteCategory(Category.id);
                            Provider.of<CategoryProviderClass>(context,
                                    listen: false)
                                .deleteCategory(Category.id);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.002,
                  );
                },
                itemCount: categoryProviderClass.incomeCategoryList.length,
              )
            : Center(
                child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.15,
                    ),
                    ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      child: Lottie.asset(
                        'images/noresults.json',
                        width: width * 0.3,
                      ),
                    ),
                    Text(
                      "   No categories added yet !",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ));
      },
    );
  }
}
