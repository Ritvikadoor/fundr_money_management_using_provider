import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/screen_catagory.dart';
import 'package:fundr_using_provider/home/view_models/home_provider.dart';
import 'package:fundr_using_provider/home/widgets/bottom_navigation.dart';
import 'package:fundr_using_provider/pie_chart/view/piechart.dart';
import 'package:fundr_using_provider/settings/view/setting_ui.dart';
import 'package:fundr_using_provider/transaction/view/screen_transaction.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  // static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  // @override
  // Widget build(BuildContext context) {
// //   @override
//   State<ScreenHome> createState() => _ScreenHomeState();{
// }

// class _ScreenHomeState extends State<ScreenHome> {
  // final _pages = [
  //   ScreenTransaction(),
  //   ScreenCatagory(),
  //   StatisticsScreen(),
  //   ScreenSettings(),
  // ];
  final pages = [
    const ScreenTransaction(),
    const ScreenCatagory(),
    const StatisticsScreen(),
    const ScreenSettings(),
  ];

  // @override
  // void initState() {
  //   // TransactionDb.instance.refresh();
  //   // CategoryDB.instance.refreshUI();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final homeScreenIndex = Provider.of<HomeProvider>(context);
    int currentScreenIndex = homeScreenIndex.fetchCurrentIndex;
    return Scaffold(
      bottomNavigationBar: MoneyManagerBottomNavigation(
        currentScreenIndex: currentScreenIndex,
      ),
      body: SafeArea(
        child:
            Consumer<HomeProvider>(builder: (BuildContext context, value, _) {
          return pages[currentScreenIndex];
        }),
      ),
    );
  }
}
