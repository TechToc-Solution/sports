import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/core/utils/app_localizations.dart';
import 'package:sports/core/utils/constats.dart';
import 'package:sports/core/utils/enums.dart';
import 'package:sports/core/utils/styles.dart';
import 'package:sports/core/utils/validation.dart';
import 'package:sports/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sports/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:sports/features/home/presentation/views/home_page.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/functions.dart';
import '../../../view-model/login_cubit/login_cubit.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});
  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text("sing_in".tr(context)),
        titleTextStyle: Styles.textStyle18.copyWith(color: Colors.white),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: kVerticalPadding),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "sing_in".tr(context),
              style: Styles.textStyle35
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          Form(
            key: _loginFormKey,
            child: Column(
              children: [
                CustomTextField(
                    text: "user_name".tr(context),
                    isPassword: false,
                    validatorFun: (p0) =>
                        Validator.validate(p0, ValidationState.normal),
                    controller: nameController),
                CustomTextField(
                    text: "password".tr(context),
                    isPassword: true,
                    validatorFun: (p0) =>
                        Validator.validate(p0, ValidationState.normal),
                    controller: passwordController),
              ],
            ),
          ),
          BlocConsumer<LoginCubit, LoginState>(
            builder: (context, state) {
              return switch (state) {
                LoginLoading() => CustomButton(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                _ => CustomButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                            userName: nameController.text,
                            passwrod: passwordController.text);
                      }
                    },
                    child: Text(
                      "login".tr(context),
                      style: Styles.textStyle15.copyWith(color: Colors.white),
                    ))
              };
            },
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              } else if (state is LoginError) {
                messages(context, state.errorMsg, Colors.red);
              }
            },
          )
        ],
      ),
    );
  }
}
