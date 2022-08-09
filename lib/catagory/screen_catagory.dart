import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/catagory/viewmodel/category_pop.dart';
import 'package:fundr_using_provider/home/view_models/home_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/catagory_add_popup.dart';
import 'widgets/expense_catagory_list.dart';
import 'widgets/income_catagory_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    context.read<CategoryDB>().getCategories().then((value) {});

    context.read<CategoryDB>().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Category',
          style: TextStyle(color: Color(0xff4b50c7), fontSize: 30),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff4b50c7),
          elevation: 0,
          onPressed: () {
            if (context.read<HomeProvider>().selectedIndexNotifier == 1) {
              context.read<CategoryPopUp>().showCategoryAddPopup(context);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
            child: Column(
              children: [
                TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: const Color(0xff4b50c7),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Income',
                      ),
                      Tab(
                        text: 'Expense',
                      ),
                    ]),
                Expanded(
                  child:
                      TabBarView(controller: _tabController, children: const [
                    IncomeCatagoryList(),
                    ExpenseCatagoryList(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
