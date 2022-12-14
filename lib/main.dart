import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundr_using_provider/catagory/viewmodel/catagory_db.dart';
import 'package:fundr_using_provider/catagory/viewmodel/category_pop.dart';
import 'package:fundr_using_provider/home/view/screen_home.dart';
import 'package:fundr_using_provider/home/view_models/home_provider.dart';
import 'package:fundr_using_provider/splash_screen/view/screen_splash.dart';
import 'package:fundr_using_provider/transaction/viewmodel/screen_add_provider.dart';
import 'package:fundr_using_provider/transaction/viewmodel/screen_edit_provider.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_db.dart';
import 'package:fundr_using_provider/transaction/viewmodel/transaction_widget.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:timezone/data/latest_all.dart' as tz;

import 'catagory/model/catagory_model.dart';
import 'transaction/model/transaction_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => CategoryDB()),
        ChangeNotifierProvider(create: (context) => CategoryPopUp()),
        ChangeNotifierProvider(create: (context) => TransactionDb()),
        ChangeNotifierProvider(create: (context) => TransactonDbWidgets()),
        // ChangeNotifierProvider(create: (context) => ScreenEditaProvider()),
        // ChangeNotifierProvider(create: (context) => EditProv()),
        ChangeNotifierProvider(
            create: (context) => ScreenAddTrandactionProvider())
      ],
      child: MaterialApp(
        home: ScreenHome(),
        //  routes: {
        //   ScreenAddTransaction.routeName: (ctx) => const ScreenAddTransaction(),
        // },
      ),
    );
  }
}
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: const [
//         GlobalWidgetsLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         MonthYearPickerLocalizations.delegate,
//       ],
//       title: 'Fundr',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ScreenSplash(),
//       routes: {
//         ScreenAddTransaction.routeName: (ctx) => const ScreenAddTransaction(),
//       },
//     );
//   }
// }
