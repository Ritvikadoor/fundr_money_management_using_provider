import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const CATEGORY_DB_NAME = 'category_database';

abstract class CategorDbFunctions {
  Future<List<CategoryModel>> getCategories();
  void insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
  Future<void> clearCategory();
}

class CategoryDB extends CategorDbFunctions with ChangeNotifier {
  // CategoryDB._internal();
  // static CategoryDB instance = CategoryDB._internal();

  // factory CategoryDB() {
  //   return instance;
  // }

  List<CategoryModel> incomeCatagoryListListener = [];
  List<CategoryModel> expenseCatagoryListListener = [];

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await categoryDB.put(value.id, value);
    print("object");
    notifyListeners();
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    notifyListeners();

    return categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final allCategories = await getCategories();
    incomeCatagoryListListener.clear();
    expenseCatagoryListListener.clear();

    Future.forEach(allCategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCatagoryListListener.add(category);
      } else {
        expenseCatagoryListListener.add(category);
      }
    });

    notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.delete(categoryID);
    refreshUI();
  }

  @override
  Future<void> clearCategory() async {
    final categoryData = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    categoryData.clear();
  }
}
