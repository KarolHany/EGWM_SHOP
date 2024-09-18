import 'package:flutter/material.dart';
import 'package:store_app_thw/pages/electronics_product_page.dart';
import 'package:store_app_thw/pages/home_page.dart';
import 'package:store_app_thw/pages/jewelery_product_page.dart';
import 'package:store_app_thw/pages/onboarding_page.dart';
import 'package:store_app_thw/pages/product_details_page.dart';
import 'package:store_app_thw/pages/womens_clothes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: OnboardingPage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ElectronicsProductPage.id: (context) => ElectronicsProductPage(),
        ProductDetailPage.id: (context) => ProductDetailPage(),
        JeweleryProductPage.id: (context) => JeweleryProductPage(),
        WomensClothes.id: (context) => WomensClothes(),
        OnboardingPage.id: (context) => OnboardingPage(),
      },
    );
  }
}
