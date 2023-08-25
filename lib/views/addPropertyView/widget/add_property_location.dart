import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:property_app/logic/location_cubit/location_cubit.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class AddPropertyLocation extends StatefulWidget {
  AddPropertyLocation({Key? key, required this.add, required this.location}) : super(key: key);

  final bool add;
  late var location;

  @override
  State<AddPropertyLocation> createState() => _AddPropertyLocationState();
}

class _AddPropertyLocationState extends State<AddPropertyLocation> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<LocationCubit>(context, listen: false).pro();
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

  var m = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state.status == LocationStatus.loading || state.status == LocationStatus.initial) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }
        if(BlocProvider.of<LocationCubit>(context).proo==null ) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }
        var proo = BlocProvider.of<LocationCubit>(context).proo;
        List<String> li = [];
        for(int i=0;i<proo.length;i++) {
          li.add(proo[i]['country'] + '; '+proo[i]['city']+'; '+proo[i]['neighborhood']+'; '+ proo[i]['street']);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.add
                ? Text(
              'Location',
              style: Style.textStyle18.copyWith(color: Color1.primaryColor),
            )
                : Text(
              "Location :",
              style: Style.textStyle22.copyWith(
                  fontWeight: FontWeight.w400, color: Color1.primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            // DropdownButton(
            //   items: k.map((items) {
            //     return DropdownMenuItem(
            //       value: items,
            //       child: Text(items),
            //     );
            //   }).toList(),
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   value: kk,
            //   onChanged: (val) async {
            //     setState(() {
            //       kk = val;
            //     });
            //     print(kk);
            //   },
            //   iconEnabledColor: Color1.primaryColor,
            // ),
            TypeAheadField(
              animationStart: 0,
              animationDuration: Duration.zero,
              textFieldConfiguration: TextFieldConfiguration(
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color1.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(35),
                    ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color1.primaryColor,width: 1),
                        borderRadius: BorderRadius.circular(35),
                      )
                  )
              ),
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Colors.lightBlue[50]
              ),
              suggestionsCallback: (pattern){
                List<String> matches = <String>[];
                matches.addAll(li);
                matches.retainWhere((s){
                  return s.toLowerCase().contains(pattern.toLowerCase());
                });
                return matches;
              },
              itemBuilder: (context, soe) {
                return Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child:Text(soe.toString()),
                    )
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  m.text = suggestion;
                  widget.location = proo[li.indexOf(suggestion)];
                });
                print(suggestion);
                print(li.contains(suggestion));
                var r = li.indexOf(suggestion);

              },
            )
          ],
        );
      },
    );
  }
}
