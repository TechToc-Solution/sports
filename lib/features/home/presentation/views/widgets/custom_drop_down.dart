import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/core/utils/colors.dart';
import 'package:sports/features/home/data/models/drop_down_items.dart';
import 'package:sports/features/home/presentation/views-model/get_dropDown_items/get_drop_down_items_cubit.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String hint;
  final String code;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.code,
    this.onChanged,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  List<DropDownItems> items = [];

  @override
  void initState() {
    super.initState();
    context.read<GetDropDownItemsCubit>().fetchDropDownItems(code: widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetDropDownItemsCubit, GetDropDownItemsState>(
      listener: (context, state) {
        if (state is GetDropDownItemsSuccess) {
          setState(() {
            items = state.items;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColors, width: 2),
          ),
          child: DropdownSearch<DropDownItems>(
            enabled: true,
            popupProps: PopupProps.menu(
              errorBuilder: (context, error, stackTrace) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error: ${error.toString()}',
                    style: const TextStyle(color: Colors.red)),
              ),
              loadingBuilder: (context, searchEntry) => const Center(
                child: CircularProgressIndicator(),
              ),
              showSearchBox: true,
              searchDelay: const Duration(milliseconds: 500),
              searchFieldProps: const TextFieldProps(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              menuProps: const MenuProps(
                backgroundColor: AppColors.avatarColor,
                elevation: 5,
              ),
            ),
            items: (String? filter, LoadProps? load) async {
              final cubit = context.read<GetDropDownItemsCubit>();
              return await cubit
                  .fetchDropDownItems(
                    code: widget.code,
                    search: filter,
                    emitState: false,
                  )
                  .then((result) => result.fold(
                        (failure) => throw failure.message,
                        (items) => items,
                      ));
            },
            itemAsString: (item) => item.name ?? '',
            onChanged: (value) {
              setState(() {
                selectedValue = value!.name;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value!.name);
              }
            },
            //selectedItem: selectedValue,
            decoratorProps: DropDownDecoratorProps(
              baseStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: InputBorder.none,
                labelText: widget.label,
                hintText: widget.hint,
                labelStyle:
                    const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            compareFn: (item1, item2) {
              return item1.name == item2.name;
            },
          ),
        ),
      ),
    );
  }
}
