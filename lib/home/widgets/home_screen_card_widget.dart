import 'package:flutter/material.dart';
import 'package:fundr_using_provider/transaction/view/screen_seemore_transaction.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:provider/provider.dart';

class ProfitCard extends StatelessWidget {
  const ProfitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        children: [
          Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeMoreTransaction(),
                    ),
                  );
                },
                child: const Text('See More:'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardProfit() {
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
            child: Consumer<TransactionDb>(
              builder: (context, totalBalance, Widget? _) {
                return Center(
                  child: Text(
                    totalBalance.recentTotal.toString(),
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
        Consumer<TransactionDb>(
          builder: (context, incomeValue, Widget? _) {
            return Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 238, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  incomeValue.incomeTotal.toString(),
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
        Consumer<TransactionDb>(
          builder: ((context, expensevalue, _) {
            return Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 238, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(expensevalue.expenseTotal.toString(),
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
