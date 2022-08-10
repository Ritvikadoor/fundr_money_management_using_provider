import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/home/view/screen_home.dart';
import 'package:fundr_using_provider/transaction/model/transaction_model.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:provider/provider.dart';

class ScreenAddTrandactionProvider with ChangeNotifier {
  DateTime? selectedDate;
  CategoryType? selectedCategoryType;
  CategoryModel? selectedCategoryModel;
  DateTime? _selectedDateTemp;

  String? categoryID;
  final purposeTextEdittingController = TextEditingController();
  final amountTextEdittingController = TextEditingController();
  Future<DateTime?> date(BuildContext context) async {
    _selectedDateTemp = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (_selectedDateTemp == null) {
      return null;
    } else {
      selectedDate = _selectedDateTemp;
      notifyListeners();
    }
  }

  Radio<CategoryType> raadioButtonFn(
      ScreenAddTrandactionProvider value, CategoryType categoryType) {
    return Radio(
      value: categoryType,
      groupValue: value.selectedCategoryType,
      onChanged: (newValue) {
        selectedCategoryType = categoryType;
        categoryID = null;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> dropDownBtn(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: const Text(
        'Select Category',
        style: TextStyle(overflow: TextOverflow.ellipsis),
      ),
      value: categoryID,
      items: (selectedCategoryType == CategoryType.income
              ? context.read<CategoryDB>().incomeCatagoryListListener
              : context.read<CategoryDB>().expenseCatagoryListListener)
          .map(
        (e) {
          return DropdownMenuItem(
            value: e.id,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(e.name),
            ),
            onTap: () {
              var selectedCategoryModel = e;
              print("object");
            },
          );
        },
      ).toList(),
      onChanged: (selectedValue) {
        categoryID = selectedValue;
        notifyListeners();
      },
    );
  }

  Future<void> addTransactionFn(BuildContext context) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final purposeText = purposeTextEdittingController.text;
    final amountText = amountTextEdittingController.text;
    if (purposeText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (categoryID == null) {
      return;
    }
    if (selectedDate == null) {
      return;
    }

    final parsedamount = double.tryParse(amountText);
    if (parsedamount == null) {
      return;
    }

    if (selectedCategoryModel == null) {
      return;
    }
    final model = TransactionModel(
      purpose: purposeText,
      amount: parsedamount,
      date: selectedDate!,
      type: selectedCategoryType!,
      category: selectedCategoryModel!,
      id: id,
    );

    // context.read<TransactionDb>().addTransaction(model);
    context.read<TransactionDb>().refresh();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenHome();
    }));
    notifyListeners();
  }

  onvalueChanged(categoryID) {
    this.categoryID = categoryID;
    notifyListeners();
  }
}
