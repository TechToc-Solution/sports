import 'package:flutter/material.dart';
import 'package:sports/features/auth/presentation/views/register/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const String routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterPageBody(),
    );
  }
}
