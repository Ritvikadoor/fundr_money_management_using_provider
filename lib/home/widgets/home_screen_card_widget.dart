import 'package:flutter/material.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:provider/provider.dart';

class ProfitCard extends StatelessWidget {
  const ProfitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionDb>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xff4b50c7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 25),
                      child: Text(
                        'PROFIT',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Row(
                        children: [
                          cardProfit(),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 60),
                  child: Column(
                    children: [
                      cardIncome(),
                      const SizedBox(
                        height: 10,
                      ),
                      cardExpense()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cardProfit() {
    var TransactionDb;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 237, 238, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ValueListenableBuilder(
              valueListenable: TransactionDb.instance.balacneNotifier,
              builder: (BuildContext context, double totalBalance, Widget? _) {
                return Center(
                  child: Text(
                    totalBalance.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget cardIncome() {
    var TransactionDb;
    return Column(
      children: [
        const Text(
          'INCOME',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1),
        ),
        const SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: TransactionDb.instance.incomeNotifier,
          builder: (BuildContext context, double incomeValue, Widget? _) {
            return Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 238, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  incomeValue.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget cardExpense() {
    var TransactionDb;
    return Column(
      children: [
        const Text(
          'EXPENSE',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1),
        ),
        const SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: TransactionDb.instance.expenseNotifier,
          builder: ((BuildContext context, expensevalue, Widget? _) {
            return Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 238, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(expensevalue.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            );
          }),
        ),
      ],
    );
  }
}
