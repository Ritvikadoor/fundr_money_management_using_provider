import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/transaction/model/transaction_model.dart';
import 'package:fundr_using_provider/transaction/viewmodel/screen_add_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditScreenTransaction extends StatelessWidget {
  const EditScreenTransaction({Key? key, required this.valued})
      : super(key: key);
  final TransactionModel valued;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff4b50c7)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Edit Transaction',
          style: TextStyle(fontSize: 20, color: Color(0xff4b50c7)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ScreenAddTrandactionProvider>(
              builder: (context, value, _) {
            return Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 237, 238, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        value.selectedCategoryType == CategoryType.income
                            ? 'Add Income'
                            : 'Add Expense',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: value.amountTextEdittingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),

                  //calender

                  Center(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextButton.icon(
                        onPressed: () async {
                          final selectedDateTemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDateTemp == null) {
                            return;
                          } else {
                            // print(selectedDateTemp.toString());
                            // setState(() {
                            //   _selectedDate = selectedDateTemp;
                            // });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        label: Text(value.selectedDate == null
                            ? DateFormat('yMMMMd').format(valued.date)
                            : DateFormat('yMMMMd').format(value.selectedDate!)),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: CategoryType.income,
                            groupValue: value.selectedCategoryType,
                            onChanged: (newValue) {
                              // setState(() {
                              //   _selectedCategoryType = CategoryType.income;
                              //   _categoryID = null;
                              // });
                            },
                          ),
                          const Text('Income'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: CategoryType.expense,
                            groupValue: value.selectedCategoryType,
                            onChanged: (newValue) {
                              // setState(() {
                              //   _selectedCategoryType = CategoryType.expense;
                              //   _categoryID = null;
                              // });
                            },
                          ),
                          const Text('Expense'),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: context
                              .read<ScreenAddTrandactionProvider>()
                              .dropDownBtn(
                                context,
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: value.purposeTextEdittingController,
                      decoration: InputDecoration(
                          hintText: 'Notes',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<ScreenAddTrandactionProvider>()
                            .addTransactionFn(context);
                      },
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
