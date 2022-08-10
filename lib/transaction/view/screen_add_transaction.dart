import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/transaction/model/transaction_model.dart';
import 'package:fundr_using_provider/transaction/viewmodel/screen_add_provider.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenAddTransaction extends StatelessWidget {
  ScreenAddTransaction({
    Key? key,
  }) : super(key: key);
  // final TransactionModel valued;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ScreenAddTrandactionProvider>(context, listen: false)
            .selectedCategoryType = CategoryType.income;
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Transaction',
          style: TextStyle(color: Color(0xff4b50c7)),
        ),
        iconTheme: const IconThemeData(color: Color(0xff4b50c7)),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            child: Consumer<ScreenAddTrandactionProvider>(
                builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
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
                          hintText: 'Amount',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextButton.icon(
                              onPressed: () async {
                                value.date(context);
                              },
                              icon: const Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                              label: Text(
                                value.selectedDate == null
                                    ? ' '
                                    : DateFormat('yMMMMd')
                                        .format(value.selectedDate!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            value.raadioButtonFn(value, CategoryType.income),
                            const Text('Income'),
                          ],
                        ),
                        Row(
                          children: [
                            value.raadioButtonFn(value, CategoryType.expense),
                            const Text(
                              'Expense',
                            ),
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
                          child: DropDMenuItems(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
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
                          print('presed');
                          context
                              .read<ScreenAddTrandactionProvider>()
                              .addTransactionFn(context);

                          context.read<TransactionDb>().refresh();
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class DropDMenuItems extends StatelessWidget {
  const DropDMenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenAddTrandactionProvider>(builder: (context, value, _) {
      return DropdownButton<String>(
        isExpanded: true,
        hint: const Text(
          'Select Category',
          style: TextStyle(overflow: TextOverflow.ellipsis),
        ),
        value: value.categoryID,
        items: (context
                        .read<ScreenAddTrandactionProvider>()
                        .selectedCategoryType ==
                    CategoryType.income
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
                context
                    .read<ScreenAddTrandactionProvider>()
                    .selectedCategoryModel = e;
              },
            );
          },
        ).toList(),
        onChanged: (selectedValue) {
          value.onvalueChanged(selectedValue);
        },
      );
    });
  }
}
