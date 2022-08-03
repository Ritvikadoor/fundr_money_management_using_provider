import 'package:flutter/material.dart';
import 'package:fundr_using_provider/pie_chart/view/expense_piechart.dart';
import 'package:fundr_using_provider/pie_chart/view/income_pie_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tabController;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff4b50c7)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Color(0xff4b50c7), fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: ListView(
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
                ],
              ),
              SizedBox(
                height: 1000,
                child: TabBarView(controller: _tabController, children: const [
                  IncomePieChartStatistics(),
                  ExpensePieChartStatistics(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
