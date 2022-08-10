// import 'package:flutter/material.dart';
// import 'package:fundr_using_provider/catagory/model/catagory_model.dart';

// class ScreenEditaProvider with ChangeNotifier {
//   DateTime? selectedDate;
//   CategoryType? selectedCategoryType;
//   CategoryModel? selectedCategoryModel;

//   String? categoryID;
//   final purposeTextEdittingController = TextEditingController();
//   final amountTextEdittingController = TextEditingController();

//   // selectedCategoryType = CategoryType.income;
//   // purposeTextEdittingController.text = widget.valued.purpose!;
//   // amountTextEdittingController.text = widget.valued.amount.toString();
//   // selectedCategoryModel = widget.valued.category;
//   // selectedDate = widget.valued.date;

// }

// class EditProv extends ChangeNotifier {
//   DateTime? selectedDate;
//   CategoryType? selectedCategorytype;
//   CategoryModel? selectedCategoryMOdel;
//   String? categoryID;

//   pickDate(BuildContext context, DateTime dBdate) async {
//     final _selectedDateTemp = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2021),
//         lastDate: DateTime.now());

//     selectedDate = _selectedDateTemp ?? dBdate;
//     notifyListeners();
//   }

//   // dropdownButtonRebuild(dynamic dropdownName) {
//   //   this.dropdownName = dropdownName;
//   //   notifyListeners();
//   // }
//   // choiceChipRebuild(String choice) {
//   //   this.choice = choice;

//   // }

//   setCategoryType(CategoryType type) {
//     selectedCategorytype = type;
//     notifyListeners();
//     print(selectedCategorytype);
//   }

//   setDate(DateTime dateFromDb) {
//     selectedDate = dateFromDb;
//     notifyListeners();
//     print(selectedDate);
//   }

//   setCategoryModel(CategoryModel model) {
//     selectedCategoryMOdel = model;
//     notifyListeners();
//     print(selectedCategoryMOdel);
//   }

//   setcategotyid(String? model) {
//     categoryID = model;
//     notifyListeners();
//     print(categoryID);
//   }
// }
