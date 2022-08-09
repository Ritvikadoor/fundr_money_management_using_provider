import 'package:flutter/material.dart';
import 'package:fundr_using_provider/catagory/model/catagory_model.dart';
import 'package:fundr_using_provider/catagory/viewmodel/category_pop.dart';
import 'package:provider/provider.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<CategoryPopUp>(builder: (BuildContext ctx, newCategory, _) {
          return newCategory.radioMethod(type);
        }),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 2),
        ),
      ],
    );
  }
}
