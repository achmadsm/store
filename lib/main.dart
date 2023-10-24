import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/api/api_service.dart';
import 'package:store/data/db/auth_repository.dart';
import 'package:store/provider/auth_provider.dart';
import 'package:store/provider/page_provider.dart';
import 'package:store/provider/product_provider.dart';
import 'package:store/provider/profile_provider.dart';
import 'package:store/provider/quote_provider.dart';
import 'package:store/provider/search_provider.dart';
import 'package:store/ui/pages/home_page.dart';
import 'package:store/ui/pages/log_in_page.dart';
import 'package:store/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(ApiService(), AuthRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(AuthRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(ApiService()),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(ApiService()),
        ),
        ChangeNotifierProvider(
          create: (context) => QuoteProvider(ApiService()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          LogInPage.routeName: (context) => LogInPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
