import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/core/utils/colors.dart';
import 'package:sports/core/utils/constats.dart';
import 'package:sports/core/widgets/custom_error_widget.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColors,
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
            child: BlocBuilder<GetFormCubit, GetFormState>(
              builder: (context, state) {
                if (state is GetFormSuccess) {
                  return FormBody(
                    fields: state.fields,
                    dropDownLists: state.dropDownLists,
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
