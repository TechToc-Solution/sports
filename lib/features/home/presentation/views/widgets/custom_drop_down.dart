import 'package:flutter/material.dart';
import 'package:sports/core/utils/colors.dart';
import 'package:sports/features/home/data/models/dropDown_items.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropDownItems> items;
  final String label;
  final String hint;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.label,
    required this.hint,
    this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColors, width: 2),
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: InputBorder.none,
            labelText: widget.label,
            hintText: widget.hint,
            labelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          style: TextStyle(fontSize: 18.0, color: AppColors.textButtonColors),
          value: selectedValue,
          items: widget.items.map((DropDownItems item) {
            return DropdownMenuItem<String>(
              value: item.id.toString(),
              child: Text(item.name!, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          dropdownColor: AppColors.primaryColors,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        ),
      ),
    );
  }
}
