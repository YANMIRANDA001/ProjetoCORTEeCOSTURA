import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'pages/sobre_page.dart';
import 'pages/loja_page.dart';
import 'pages/loja1_page.dart';
import 'pages/loja2_page.dart';


void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: IntroPage(),
  routes: {
    '/intro_page': (context) => IntroPage(),
    '/shop_page': (context) => ShopPage(),
    '/cart_page': (context) => CartPage(cart: []),
    '/sobre_page': (context) => SobrePage(),
    '/loja_page': (context) => LojaPage(),
    '/loja1_page': (context) => Loja1Page(),
    'loja2_page': (context) => Loja2Page()
  }
);

  }
}
