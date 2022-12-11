import 'package:flutter/material.dart';
import 'package:praktikum_7/perpustakaan_list_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:praktikum_7/db_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => DbProvider(),
    ),
    ChangeNotifierProvider(
      child: MyApp(),
      create: (context) => ThemeProvider(),
    ),
  ]));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ((context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Toko Buku",
          theme: ThemeData(
            primarySwatch: Colors.brown,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: PerpustakaanListPage(),
        );
      }),
    );
  }
}
