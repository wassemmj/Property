import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';

import '../../../Core/color1.dart';

class AddPropertyDropDownButton extends StatefulWidget {
  const AddPropertyDropDownButton({Key? key}) : super(key: key);

  @override
  State<AddPropertyDropDownButton> createState() =>
      _AddPropertyDropDownButtonState();
}

class _AddPropertyDropDownButtonState extends State<AddPropertyDropDownButton> {

  String? dropdownvalue = 'Select Item';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AllPropertyCubit>(context, listen: false).catt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPropertyCubit, AllPropertyState>(
      builder: (context, state) {
        if(state.status == AllPropertyStatus.loading) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }
        if(BlocProvider.of<AllPropertyCubit>(context).category == null) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }
        var cat = BlocProvider.of<AllPropertyCubit>(context).category;
        List<String> catName = [];
        for(int i =0 ;i<cat!.length;i++) {
          if(catName.contains(cat[i]['name'])) {

          }
          else {
            catName.add(cat[i]['name']);
          }
        }
        List<String> items = ['Select Item', ...catName];
        return DropdownButton(
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          icon: const Icon(Icons.keyboard_arrow_down),
          value: dropdownvalue,
          onChanged: (val) {
            setState(() {
              dropdownvalue = val;
            });
          },
          iconEnabledColor: Color1.primaryColor,
        );
      },
    );
  }
}
