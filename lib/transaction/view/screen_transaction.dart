import 'package:flutter/material.dart';
import 'package:fundr_using_provider/home/widgets/home_screen_card_widget.dart';
import 'package:fundr_using_provider/settings/models/settings_models.dart';
import 'package:fundr_using_provider/transaction/view/edit_transaction/screen_edit_screen_transaction.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text('hi'),
      body: Column(
        children: [
          const ProfitCard(),
          transactionList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4b50c7),
        elevation: 0,
        onPressed: () {
          // if (ScreenHome.selectedIndexNotifier.value == 0) {
          //   var routeName;
          //   Navigator.of(context).pushNamed(ScreenAddTransaction.routeName!);
          // }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  transactionList() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 237, 238, 255),
        ),
        child: Consumer<TransactionDb>(
          builder: (context, valued, _) {
            return ListView.separated(
              itemBuilder: ((BuildContext context, int index) {
                final value = valued.incomeList[index];

                return Slidable(
                  //key: Key(value.id!),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        icon: Icons.delete,
                        label: 'Delete',
                        onPressed: (ctx) {
                          _showMyDialog(context, id: value.id!);
                        },
                      ),
                      SlidableAction(
                        onPressed: (ctx) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditScreenTransaction(
                                  valued: value,
                                ),
                              ));
                        },
                        icon:
                            const IconData(0xf00d, fontFamily: 'MaterialIcons'),
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          tileColor: Colors.white,
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
                          title: Text(value.category.name.toString()),
                          subtitle: Text(
                            parseDate(value.date),
                          ),
                          trailing: Text(
                            '\u{20B9} ${value.amount.toString()}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 2,
                );
              },
              itemCount:
                  valued.incomeList.length < 5 ? valued.incomeList.length : 5,
            );
          },
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final splitDate = _date.split(' ');
    return '${splitDate.last} ${splitDate.first}';
  }

  Future<void> _showMyDialog<TransactionModel>(BuildContext context,
      {required String id}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Transaction'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Do you really want to delete transaction '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // TransactionDb.instance.deleteTransaction(id);
                // TransactionDb.instance.refresh();
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
