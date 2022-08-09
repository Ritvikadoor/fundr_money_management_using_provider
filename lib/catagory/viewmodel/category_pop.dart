import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/catagory/widgets/catagory_add_popup.dart';
import 'package:provider/provider.dart';

import '../model/catagory_model.dart';

class CategoryPopUp with ChangeNotifier {
  CategoryType selectedCategoryNotifier = CategoryType.income;

  Future<void> showCategoryAddPopup(BuildContext context) async {
    final nameEditingController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          backgroundColor: const Color.fromARGB(255, 237, 238, 255),
          title: const Text(
            'Add Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: nameEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Category Name',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  RadioButton(
                    title: 'Income',
                    type: CategoryType.income,
                  ),
                  RadioButton(
                    title: 'Expense',
                    type: CategoryType.expense,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () async {
                  final name = nameEditingController.text;
                  if (name.isEmpty) {
                    return;
                  }
                  final type = selectedCategoryNotifier;
                  final category = CategoryModel(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: name,
                    type: type,
                  );
                  context.read<CategoryDB>().insertCategory(category);
                  print("pressed");
                  Navigator.of(ctx).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff4b50c7),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text(
                  'ADD',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Radio<CategoryType> radioMethod(
    final CategoryType type,
  ) {
    return Radio<CategoryType>(
      value: type,
      groupValue: selectedCategoryNotifier,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        selectedCategoryNotifier = value;
        notifyListeners();
        // newCategory.selectedCategoryNotifier.notifyListeners();
      },
    );
  }
}
