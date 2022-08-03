// import 'package:flutter/material.dart';
// import 'package:fundr_using_provider/settings/models/settings_models.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:intl/intl.dart';

// class SettingsDB with ChangeNotifier {
//   @override
//   deleteTransaction(String index) async {
//     final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
//     _db.delete(index);
//   }

//   @override
//   Future<void> updateTransaction(TransactionModel obj, String id) async {
//     final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
//     _db.put(id, obj);
//     refresh();
//   }

//   @override
//   Future<void> clearData() async {
//     final clearDataDb =
//         await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
//     await clearDataDb.clear();
//   }

//   @override
//   Future<void> clearCategory() async {
//     final clearDataCategory = await Hive.openBox<CategoryDB>(CATEGORY_DB_NAME);
//     await clearDataCategory.clear();
//   }
// }
