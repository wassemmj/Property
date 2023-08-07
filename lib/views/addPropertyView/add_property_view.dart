import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/data/Model/property_model.dart';
import 'package:property_app/logic/create_property_cubit/create_property_cubit.dart';
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
        child: BlocBuilder<CreatePropertyCubit, CreatePropertyState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                              Icons.arrow_back, color: Color1.primaryColor),
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
            );
          },
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
          if(index == 1) {
            BlocProvider.of<CreatePropertyCubit>(context).create(PropertyModel(
              locationId: 1,
              categoryId: '${1}',
              space: 500,
              description: '1234tyhmkxcvbnmlkjhg',
              bathCount: 0,
              roomCount: 0,
              floorCount: 0,
              floorNumber: 0,
              buildingName: 'ghjbnkmkjhgfcvbnmjh',
              shared: false,
              isHeatControl: false,
              airConditioning: false,
              fireplace: false,
              ventilationSystem: false,
              isSecurity: false,
              guard: false,
              cameras: false,
              fireAlert: false,
              earthQuake: false,
              isSupplies: false,
              solarPower: false,
              internetAccess: false,
              elevator: false,
              landLine: false,
              mainStreetAccess: false,
              garage: false,
              isLuxry: false,
              pool: false,
              garden: false,
              viewOnSea: false,
              isindustry: false,
              isolation: false,
              rodenControl: false,
              capacity: 2540,
              truckAccessible: false,
              rent: false,
              receivingDate: 'jhkk',
              delivareTime: 'jhkljhk',
              pricePerDay: 5450,
              purchase: false,
              totalPrice: 545450,
              pricePerMeter: 5454540,
            ));
          }
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
