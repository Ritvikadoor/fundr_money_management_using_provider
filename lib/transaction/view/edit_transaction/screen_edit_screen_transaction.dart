import 'package:flutter/material.dart';
import 'package:fundr_using_provider/settings/models/settings_models.dart';
import 'package:intl/intl.dart';

class EditScreenTransaction extends StatelessWidget {
  const EditScreenTransaction({Key? key, required TransactionModel valued})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedCategoryType;
    var _amountTextEdittingController;
    var widget;
    var _selectedDate;
    var _categoryID;
    var _categoryID_categoryID;
    var _purposeTextEdittingController;
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
          child: Container(
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
                      _selectedCategoryType == CategoryType.income
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
                    controller: _amountTextEdittingController,
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
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 30)),
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
                      label: Text(_selectedDate == null
                          ? DateFormat('yMMMMd').format(widget.valued.date)
                          : DateFormat('yMMMMd').format(_selectedDate!)),
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
                          groupValue: _selectedCategoryType,
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
                          groupValue: _selectedCategoryType,
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
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: _selectedCategoryType == widget.valued.type
                            ? Text(widget.valued.category.name)
                            : const Text('Selected Category'),
                        value: _categoryID_categoryID,
                        items: (_selectedCategoryType == CategoryType.income
                                ? CategoryDB().incomeCatagoryListListener
                                : CategoryDB().expenseCatagoryListListener)
                            .value
                            .map(
                          (e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(e.name),
                              ),
                              onTap: () {
                                var _selectedCategoryModel = e;
                              },
                            );
                          },
                        ).toList(),
                        onChanged: (selectedValue) {
                          // print(selectedValue);
                          // setState(() {
                          //   _categoryID = selectedValue;
                          // });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _purposeTextEdittingController,
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
                      // addTransaction();
                    },
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

CategoryDB() {}
