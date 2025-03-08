import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports/features/home/data/models/dropDown_items.dart';
import 'package:sports/features/home/data/models/fields.dart';
import 'package:sports/features/home/presentation/views/widgets/custom_drop_down.dart';
import 'package:sports/features/home/presentation/views/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class FormBody extends StatelessWidget {
  FormBody({super.key, required this.fields, required this.dropDownLists});
  List<Fields> fields;
  List<List<DropDownItems>> dropDownLists;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < fields.length; i++)
          if (fields[i].dropdown == "")
            CustomTextField(
              label: fields[i].name!,
              hint: fields[i].label!,
              keyboardType: fields[i].type == "str"
                  ? TextInputType.text
                  : fields[i].type == "num"
                      ? TextInputType.number
                      : TextInputType.datetime,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )
          else
            CustomDropdown(
              label: fields[i].name!,
              hint: fields[i].label!,
              onChanged: (value) {},
              items: fields[i].dropdown == null || fields[i].dropdown == ""
                  ? []
                  : dropDownLists[i],
            )

        // CustomTextField(
        //   label: "Label",
        //   hint: "DD/MM/YYYY",
        //   isDatePicker: true,
        //   keyboardType: TextInputType.datetime,
        // ),
      ],
    );
  }
}
