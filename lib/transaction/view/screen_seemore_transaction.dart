import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:fundr_using_provider/transaction/model/transaction_model.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_widget.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:fundr_using_provider/transaction/view/edit_transaction/screen_edit_screen_transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SeeMoreTransaction extends StatelessWidget {
  const SeeMoreTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff4b50c7)),
        title: const Text(
          'Transactions',
          style: TextStyle(color: Color(0xff4b50c7)),
        ),
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<TransactonDbWidgets>(
              builder: (BuildContext context, value, child) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff4b50c7),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconSize: 0,
                            dropdownColor: const Color(0xff4b50c7),
                            value: value.dropdownvalue.toString(),
                            items: value.items.map((String items) {
                              return DropdownMenuItem(
                                value: items.toString(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    items.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // setState(() {
                              //   dropdownvalue = newValue;
                              //   if (newValue == 'All') {
                              //     selectedlist = TransactionDb
                              //         .instance.transationListNotifier;
                              //     TransactionDb.instance
                              //         .filtration(selectedlist.value);
                              //   } else if (newValue == 'Income') {
                              //     selectedlist = TransactionDb
                              //         .instance.incomeChartListNotifier;
                              //     TransactionDb.instance
                              //         .filtration(selectedlist.value);
                              //   } else {
                              //     selectedlist = TransactionDb
                              //         .instance.expenseChartListNotifier;
                              //     TransactionDb.instance
                              //         .filtration(selectedlist.value);
                              //   }
                              // });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff4b50c7),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              iconSize: 0,
                              dropdownColor: const Color(0xff4b50c7),
                              value: value.dropdowncustomDate.toString(),
                              items: value.customDAte.map((String customDAte) {
                                return DropdownMenuItem(
                                  value: customDAte.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                      customDAte.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? customDAtenewValue) {
                                value.onTabChangeFunction(
                                    context, customDAtenewValue);
                              }),
                        ),
                      ),
                      Visibility(
                        visible:
                            value.dropdowncustomDate == "Month" ? true : false,
                        child: IconButton(
                            onPressed: () {
                              pikdate(context: context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Consumer<TransactionDb>(
                    builder: (BuildContext ctx, newList, _) {
                      return ListView.separated(
                        itemBuilder: ((context, index) {
                          //values
                          final value = newList.transactionListNotifier[index];
                          return Slidable(
                            // key: Key(value.id!),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) {
                                    newList
                                        .deleteTransaction(value.id.toString());
                                    newList.refresh();
                                  },
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: (ctx) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditScreenTransaction(
                                            valued: value,
                                          ),
                                        ));
                                  },
                                  icon: const IconData(0xf00d,
                                      fontFamily: 'MaterialIcons'),
                                  label: 'Edit',
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Card(
                                elevation: 0,
                                child: ListTile(
                                  tileColor:
                                      const Color.fromARGB(255, 237, 238, 255),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: value.type == CategoryType.income
                                        ? const Icon(
                                            Icons.arrow_circle_down_sharp,
                                            color: Colors.green,
                                            size: 40,
                                          )
                                        : const Icon(
                                            Icons.arrow_circle_up_sharp,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                  ),
                                  title: Text(value.category.name),
                                  subtitle: Text(
                                    parseDate(value.date),
                                  ),
                                  trailing: Text(
                                    '\u{20B9} ${value.amount}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (ctx, index) {
                          return Container();
                        },
                        itemCount: newList.transactionListNotifier.length,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.last}\n${_splitDate.first}';
  }

  Future<void> pikdate({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    var selectedmonth;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: selectedmonth,
      firstDate: DateTime(2017),
      lastDate: DateTime(2023),
      locale: localeObj,
    );

    if (selected != null) {
      // setState(() {
      //   selectedmonth = selected;
      // });
    }
    // TransactionDb.instance.monthlyListNotifier.value.clear();
    // Future.forEach(TransactionDb.instance.transationListNotifier.value,
    //     (TransactionModel element) {
    //   if (element.date.month == selectedmonth.month &&
    //       element.date.year == selectedmonth.year) {
    //     TransactionDb.instance.monthlyListNotifier.value.add(element);
    //   }

    //   TransactionDb.instance.monthlyListNotifier.notifyListeners();
    // });
  }
}
