import 'package:flutter/material.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:provider/provider.dart';

class TransactonDbWidgets with ChangeNotifier {
  String? dropdownvalue = 'All';
  String? dropdownmonthValue = 'Jan';
  String? dropdowncustomDate = 'Today';
  var dateTimenow = DateTime.now().month.toString();
  var dateTimeYear = DateTime.now().year.toString();

  var items = ['All', 'Income', 'Expense'];
  var customDAte = ['Today', 'Yesterday', 'Week', 'Month'];

  DateTime? selectedCustomDateFirst;
  DateTime? selectedCustomDateLast;
  String? categoryTraID;
  onTabChangeFunction(BuildContext context, String? customDAtenewValue) {
    if (customDAtenewValue == 'Today') {
      dropdowncustomDate = customDAtenewValue;
      context.read<TransactionDb>().transactionListNotifier =
          context.read<TransactionDb>().todayListNotifier;
      notifyListeners();
    } else if (customDAtenewValue == 'Yesterday') {
      // setState(() {
      dropdowncustomDate = customDAtenewValue;
      context.read<TransactionDb>().transactionListNotifier =
          context.read<TransactionDb>().yesterdayListNotifier;
      // });
    } else if (customDAtenewValue == 'Week') {
      // setState(() {
      dropdowncustomDate = customDAtenewValue;
      context.read<TransactionDb>().transactionListNotifier =
          context.read<TransactionDb>().weeklyListNotifier;
      // });
    } else if (customDAtenewValue == 'Month') {
      // setState(() {
      dropdowncustomDate = customDAtenewValue;
      context.read<TransactionDb>().transactionListNotifier =
          context.read<TransactionDb>().monthlyListNotifier;
      // });
    }
  }
}
