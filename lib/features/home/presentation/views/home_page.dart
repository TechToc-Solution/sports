import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/core/utils/colors.dart';
import 'package:sports/core/utils/constats.dart';
import 'package:sports/core/widgets/custom_error_widget.dart';
import 'package:sports/features/auth/presentation/views/login/login_page.dart';
import 'package:sports/features/home/presentation/views-model/get_form/get_form_cubit.dart';
import 'package:sports/features/home/presentation/views/form_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primaryColors),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColors),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.primaryColors,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColors,
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: BlocBuilder<GetFormCubit, GetFormState>(
              builder: (context, state) {
                if (state is GetFormSuccess) {
                  return FormBody(
                    fields: state.fields,
                  );
                } else if (state is GetFormFailuer) {
                  return CustomErrorWidget(
                      errorMessage: state.errorMessage, onRetry: () {});
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
      ),
    );
  }
}
