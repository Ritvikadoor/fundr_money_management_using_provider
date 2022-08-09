import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:provider/provider.dart';

class IncomeCatagoryList extends StatelessWidget {
  const IncomeCatagoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<CategoryDB>(
        builder: (context, value, child) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: value.incomeCatagoryListListener.length,
              itemBuilder: (BuildContext ctx, index) {
                final category = value.incomeCatagoryListListener[index];
                return InkWell(
                  child: Container(
                    key: Key(category.id),
                    alignment: Alignment.center,
                    child: Text(category.name.toString()),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 237, 238, 255),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onTap: () {
                    // _showMyDialog(context, category.id);
                  },
                );
              });
        },
      ),
    );
  }
}
