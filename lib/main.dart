import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management_project/model/category_model/category_model.dart';
import 'package:money_management_project/model/profile_model/user_model.dart';
import 'package:money_management_project/model/transaction_model/transaction_model.dart';
import 'package:money_management_project/providers/category_provider.dart';
import 'package:money_management_project/providers/chart_provider.dart';
import 'package:money_management_project/providers/profile_provider.dart';
import 'package:money_management_project/providers/transaction_provider.dart';
import 'package:money_management_project/view/splash_screens/splash1.dart';
import 'package:money_management_project/view/splash_screens/splash2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

    runApp(MyApp(hasSeenSplash));
  });
}

class MyApp extends StatelessWidget {
  final bool hasSeenSplash;
  const MyApp(this.hasSeenSplash, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProviderClass()),
        ChangeNotifierProvider(create: (context) => TransactionProviderClass()),
        ChangeNotifierProvider(create: (context) => ProfileProviderClass()),
        ChangeNotifierProvider(
          create: (context) => ChartProviderClass(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        debugShowCheckedModeBanner: false,
        home: hasSeenSplash ? Splash2() : Splash1(),   
      ),
    );
  }
}
