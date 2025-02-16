import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/card_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'EuphoriaTix',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(183, 169, 246, 1.0),
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, primary: Colors.deepPurpleAccent),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                backgroundColor: Color.fromRGBO(183, 169, 246, 1.0)),
            useMaterial3: true),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
