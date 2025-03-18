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
  bool isLoading = false;

  Future<void> fetchItems() async {
    if (items.isEmpty && !isLoading) {
      setState(() {
        isLoading = true;
      });
      context.read<GetDropDownItemsCubit>().fetchDropDownItems(widget.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetDropDownItemsCubit, GetDropDownItemsState>(
      listener: (context, state) {
        if (state is GetDropDownItemsSuccess) {
          setState(() {
            items = state.items;
            isLoading = false;
          });
        } else if (state is GetDropDownItemsFailuer) {
          setState(() {
            isLoading = false;
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
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
              labelText: widget.label,
              hintText: widget.hint,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            style: const TextStyle(
                fontSize: 18.0, color: AppColors.textButtonColors),
            value: selectedValue,
            items: items.isNotEmpty
                ? items.map((DropDownItems item) {
                    return DropdownMenuItem<String>(
                      value: item.id.toString(),
                      child: Text(item.name!,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList()
                : [],
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            onTap: fetchItems, // جلب البيانات عند فتح القائمة
            dropdownColor: AppColors.primaryColors,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
