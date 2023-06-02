import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/addPropertyView/widget/add_property1.dart';
import 'package:property_app/views/addPropertyView/widget/add_property2.dart';

class AddPropertyView extends StatefulWidget {
  const AddPropertyView({Key? key}) : super(key: key);

  @override
  State<AddPropertyView> createState() => _AddPropertyViewState();
}

class _AddPropertyViewState extends State<AddPropertyView> {
  int index = 0;
  late List screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const AddProperty1(),
      AddProperty2(indexz: () {
        setState(() {
          index = (index - 1);
        });
      },),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color1.primaryColor),
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 80),
                    const Text(
                      'Add new Property',
                      style: Style.textStyle22,
                    )
                  ],
                ),
                const SizedBox(height: 25),
                screens[index],
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (index < screens.length - 1) {
              index++;
            }
            return;
          });
        },
        backgroundColor: Color1.primaryColor.withOpacity(0.7),
        child: Icon(
          index == screens.length - 1 ? Icons.check : Icons.arrow_forward,
          color: Color1.white,
        ),
      ),
    );
  }
}
