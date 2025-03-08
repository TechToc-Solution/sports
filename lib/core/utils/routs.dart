import 'package:flutter/material.dart';
import 'package:sports/features/auth/presentation/views/login/login_page.dart';
import '../../features/auth/presentation/views/register/register_page.dart';
import '../../features/home/presentation/views/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomePage.routeName: (context) => const HomePage(),
    LoginPage.routeName: (context) => const LoginPage(),
    RegisterPage.routeName: (context) => const RegisterPage(),
  };
}
