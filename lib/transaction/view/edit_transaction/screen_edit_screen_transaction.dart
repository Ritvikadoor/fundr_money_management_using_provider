// import 'package:flutter/material.dart';
// import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
// import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
// import 'package:fundr_using_provider/home/view/screen_home.dart';
// import 'package:fundr_using_provider/transaction/model/transaction_model.dart';
// import 'package:fundr_using_provider/transaction/viewmodel/screen_add_provider.dart';
// import 'package:fundr_using_provider/transaction/viewmodel/screen_edit_provider.dart';
// import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class EditScreenTransaction extends StatefulWidget {
//   EditScreenTransaction({Key? key, required this.valued}) : super(key: key);
//   final TransactionModel valued;

//   @override
//   State<EditScreenTransaction> createState() => _EditScreenTransactionState();
// }

// class _EditScreenTransactionState extends State<EditScreenTransaction> {
//   DateTime? _selectedDate;
//   CategoryModel? _selectedCategoryModel;

//   String? _categoryID;
//   final _purposeTextEdittingController = TextEditingController();
//   final _amountTextEdittingController = TextEditingController();

//   CategoryType? _selectedCategoryType;
//   @override
//   void initState() {
//     _purposeTextEdittingController.text = widget.valued.purpose.toString();
//     _amountTextEdittingController.text = widget.valued.amount.toString();
//     _selectedCategoryType = widget.valued.category.type;
//     _selectedCategoryModel = widget.valued.category;
//     _selectedDate = widget.valued.date;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Color(0xff4b50c7)),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: const Text(
//           'Edit Transaction',
//           style: TextStyle(fontSize: 20, color: Color(0xff4b50c7)),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Consumer<ScreenEditaProvider>(builder: (context, value, _) {
//             return Container(
//               height: 500,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: const Color.fromARGB(255, 237, 238, 255),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 30,
//                     child: Center(
//                       child: Text(
//                         value.selectedCategoryType == CategoryType.income
//                             ? 'Add Income'
//                             : 'Add Expense',
//                         style: const TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: _amountTextEdittingController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color.fromARGB(255, 255, 255, 255),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(50)),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       width: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white,
//                       ),
//                       child: TextButton.icon(
//                         onPressed: () async {
//                           final selectedDateTemp = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now()
//                                 .subtract(const Duration(days: 30)),
//                             lastDate: DateTime.now(),
//                           );
//                           if (selectedDateTemp == null) {
//                             return;
//                           } else {
//                             // print(selectedDateTemp.toString());
//                             // setState(() {
//                             //   _selectedDate = selectedDateTemp;
//                             // });
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.calendar_today,
//                           color: Colors.black,
//                         ),
//                         label: Text(value.selectedDate == null
//                             ? DateFormat('yMMMMd').format(widget.valued.date)
//                             : DateFormat('yMMMMd').format(value.selectedDate!)),
//                       ),
//                     ),
//                   ),
//                   Consumer<EditProv>(builder: (context, value, _) {
//                     return Row(
//                       children: [
//                         ChoiceChip(
//                           elevation: 10,
//                           padding: const EdgeInsets.all(15),
//                           label: Text(
//                             'Income',
//                             style: TextStyle(
//                                 color: value.selectedCategorytype ==
//                                         CategoryType.income
//                                     ? Colors.white
//                                     : Colors.black,
//                                 letterSpacing: 2),
//                           ),
//                           selected:
//                               value.selectedCategorytype == CategoryType.income
//                                   ? true
//                                   : false,
//                           selectedColor: Colors.green,
//                           onSelected: (val) {
//                             value.setCategoryType(CategoryType.income);
//                             _selectedCategoryType = value.selectedCategorytype;
//                             value.setcategotyid(null);
//                             // setState(() {
//                             //   _selectedCategorytype =
//                             //       CategoryType.income;
//                             //   _categoryID = null;
//                             // });
//                           },
//                         ),
//                         ChoiceChip(
//                           elevation: 10,
//                           padding: const EdgeInsets.all(15),
//                           label: Text(
//                             'Expense',
//                             style: TextStyle(
//                                 color: value.selectedCategorytype ==
//                                         CategoryType.expense
//                                     ? Colors.white
//                                     : Colors.black,
//                                 letterSpacing: 2),
//                           ),
//                           selected:
//                               value.selectedCategorytype == CategoryType.expense
//                                   ? true
//                                   : false,
//                           selectedColor: Colors.red,
//                           onSelected: (val) {
//                             value.setCategoryType(CategoryType.expense);
//                             _selectedCategoryType = value.selectedCategorytype;
//                             value.setcategotyid(null);
//                             // setState(() {
//                             //   _selectedCategorytype =
//                             //       CategoryType.expense;
//                             //   _categoryID = null;
//                             // });
//                           },
//                         ),
//                       ],
//                     );
//                   }),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     Row(
//                   //       children: [
//                   //         Radio(
//                   //           value: CategoryType.income,
//                   //           groupValue: value.selectedCategoryType,
//                   //           onChanged: (newValue) {
//                   //             // setState(() {
//                   //             //   _selectedCategoryType = CategoryType.income;
//                   //             //   _categoryID = null;
//                   //             // });
//                   //           },
//                   //         ),
//                   //         const Text('Income'),
//                   //       ],
//                   //     ),
//                   //     Row(
//                   //       children: [
//                   //         Radio(
//                   //           value: CategoryType.expense,
//                   //           groupValue: value.selectedCategoryType,
//                   //           onChanged: (newValue) {
//                   //             // setState(() {
//                   //             //   _selectedCategoryType = CategoryType.expense;
//                   //             //   _categoryID = null;
//                   //             // });
//                   //           },
//                   //         ),
//                   //         const Text('Expense'),
//                   //       ],
//                   //     ),
//                   //   ],
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Container(
//                       height: 60,
//                       padding: const EdgeInsets.all(5.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: Consumer<EditProv>(
//                         builder: (context, value, _) =>
//                             DropdownButtonHideUnderline(
//                           child: DropdownButton(
//                             hint: value.selectedCategorytype ==
//                                     widget.valued.type
//                                 ? Text(
//                                     widget.valued.category.name,
//                                     style: const TextStyle(
//                                         color: Color(0xffe7eed0)),
//                                   )
//                                 : const Text('Select a category',
//                                     style: TextStyle(color: Color(0xffe7eed0))),
//                             value: value.categoryID,
//                             dropdownColor: const Color(0xff948e99),
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xffe7eed0),
//                               fontSize: 19,
//                             ),
//                             icon: const Icon(Icons.keyboard_arrow_down),
//                             items: (value.selectedCategorytype ==
//                                         CategoryType.income
//                                     ? context
//                                         .read<CategoryDB>()
//                                         .incomeCatagoryListListener
//                                     : context
//                                         .read<CategoryDB>()
//                                         .expenseCatagoryListListener)
//                                 .map((e) {
//                               return DropdownMenuItem(
//                                 value: e.id,
//                                 child: Text(e.name),
//                                 onTap: () {
//                                   value.selectedCategoryMOdel = e;
//                                 },
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               value.setcategotyid(newValue);
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: _purposeTextEdittingController,
//                       decoration: InputDecoration(
//                         hintText: 'Notes',
//                         fillColor: Colors.white,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       minLines: 1,
//                       maxLines: 5,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         update(context);
//                       },
//                       child: const Text('Update'),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   Future<void> update(BuildContext context) async {
//     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     final purposeText = _purposeTextEdittingController.text;
//     final amountText = _amountTextEdittingController.text;
//     if (purposeText.isEmpty) {
//       return;
//     }
//     if (amountText.isEmpty) {
//       return;
//     }
//     if (_categoryID == null) {
//       return;
//     }
//     if (_selectedDate == null) {
//       return;
//     }

//     final parsedamount = double.tryParse(amountText);
//     if (parsedamount == null) {
//       return;
//     }

//     if (_selectedCategoryModel == null) {
//       return;
//     }
//     final model = TransactionModel(
//       purpose: purposeText,
//       amount: parsedamount,
//       date: _selectedDate!,
//       type: _selectedCategoryType!,
//       category: _selectedCategoryModel!,
//       id: id,
//     );

//     await context
//         .read<TransactionDb>()
//         .updateTransaction(model, widget.valued.id.toString());
//     context.read<TransactionDb>().refresh();
//     Navigator.of(context).pop();
//   }
// }
