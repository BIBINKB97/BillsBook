import 'package:flutter/material.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/providers/category_provider.dart';
import 'package:provider/provider.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          titlePadding: EdgeInsets.only(left: 65, top: 20),
          title: Text(
            'Add New category',
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameEditingController,
                decoration: InputDecoration(
                    hintText: 'Enter category name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RadioButton(title: 'Income', type: CategoryType.income),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  RadioButton(title: 'Expense', type: CategoryType.expense)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final name = nameEditingController.text;
                  if (name.isEmpty) {
                    return;
                  }

                  final type = selectedCategoryNotifier.value;
                  final category = CategoryModel(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: name,
                    type: type,
                  );
                  // CategoryDB.instance.insertCategory(category);
                  Provider.of<CategoryProviderClass>(context, listen: false)
                      .insertCategory(category);
                  Navigator.of(ctx).pop();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(200, 151, 52, 184))),
                child: Text('Add'),
              ),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                  value: type,
                  groupValue: newCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selectedCategoryNotifier.value = value;
                  });
            }),
        Text(title),
      ],
    );
  }
}
