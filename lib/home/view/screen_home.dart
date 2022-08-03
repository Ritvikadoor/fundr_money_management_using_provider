import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/screen_catagory.dart';
import 'package:fundr_using_provider/home/widgets/bottom_navigation.dart';
import 'package:fundr_using_provider/pie_chart/view/piechart.dart';
import 'package:fundr_using_provider/settings/view/setting_ui.dart';
import 'package:fundr_using_provider/transaction/view/screen_transaction.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _pages = const [
    ScreenTransaction(),
    ScreenCatagory(),
    StatisticsScreen(),
    ScreenSettings(),
  ];

  @override
  void initState() {
    // TransactionDb.instance.refresh();
    // CategoryDB.instance.refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: ScreenHome.selectedIndexNotifier,
            builder: (BuildContext context, int updatedIndex, _) {
              return _pages[updatedIndex];
            }),
      ),
    );
  }
}
