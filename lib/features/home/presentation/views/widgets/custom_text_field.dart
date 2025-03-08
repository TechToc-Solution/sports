import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports/core/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isDatePicker;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.isDatePicker = false,
    this.inputFormatters, // Allow optional input formatters
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColors, // Highlight color
              onPrimary: Colors.white, // Text color
              onSurface: Colors.black, // Background color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

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
        child: TextFormField(
          controller: _controller,
          readOnly: widget.isDatePicker,
          onTap: widget.isDatePicker
              ? () => _selectDate(context)
              : null, // Open calendar
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType, // Set the input type here
          decoration: InputDecoration(
            prefixIcon: widget.keyboardType == TextInputType.text
                ? Icon(Icons.text_fields)
                : widget.keyboardType == TextInputType.number
                    ? Icon(Icons.numbers)
                    : Icon(Icons.date_range),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: InputBorder.none,
            labelText: widget.label,
            prefixIconColor: AppColors.primaryColors,
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 18.0, color: AppColors.borderColor),
            labelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          style: TextStyle(fontSize: 18.0, color: AppColors.borderColor),
        ),
      ),
    );
  }
}
