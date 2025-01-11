import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';
import 'package:shop_app/product_details_page.dart';
import 'package:shop_app/global_variables.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1),
        primary: Color.fromRGBO(254, 206, 1, 1)
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black
          )
        ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        )
      )
      ),
       home: Homepage()
      //  ProductDetailsPage(
      // product: products[0],
      //),  
    );
  }
}