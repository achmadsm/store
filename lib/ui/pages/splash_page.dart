import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/db/auth_repository.dart';
import 'package:store/ui/pages/home_page.dart';
import 'package:store/ui/pages/log_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        AuthRepository authRepository = AuthRepository();
        String? token = await authRepository.getToken();

        if (!mounted) return;

        if (token == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, LogInPage.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'Halo',
          textAlign: TextAlign.center,
          style: whiteTextStyle.copyWith(
            fontSize: 32,
            fontWeight: medium,
            letterSpacing: 10.08,
          ),
        ),
      ),
    );
  }
}
