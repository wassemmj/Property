import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:property_app/logic/price_cubit/price_cubit.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../../logic/location_cubit/location_cubit.dart';

class PriceView extends StatefulWidget {
  const PriceView({Key? key}) : super(key: key);

  @override
  State<PriceView> createState() => _PriceViewState();
}

class _PriceViewState extends State<PriceView> {
  var m = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<LocationCubit>(context, listen: false).pro();
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

  var location;

  double spaceStart = 0;

  bool s = false;
  bool sup = false;
  bool ind = false;
  bool heat = false;
  bool lux = false;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery
        .of(context)
        .size
        .height
        .toInt();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color1.white,
        title: Text(
          'Price Property',
          style: Style.textStyle22.copyWith(
              fontSize: (height / 34.3).floorToDouble(),
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state.status == LocationStatus.loading ||
                    state.status == LocationStatus.initial) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: Color1.primaryColor,
                        strokeWidth: 1,
                      ));
                }
                if (BlocProvider
                    .of<LocationCubit>(context)
                    .proo == null) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: Color1.primaryColor,
                        strokeWidth: 1,
                      ));
                }
                var proo = BlocProvider
                    .of<LocationCubit>(context)
                    .proo;
                List<String> li = [];
                for (int i = 0; i < proo.length; i++) {
                  li.add(proo[i]['country'] +
                      '; ' +
                      proo[i]['city'] +
                      '; ' +
                      proo[i]['neighborhood'] +
                      '; ' +
                      proo[i]['street']);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location :",
                      style: Style.textStyle22.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color1.primaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TypeAheadField(
                      animationStart: 0,
                      animationDuration: Duration.zero,
                      textFieldConfiguration: TextFieldConfiguration(
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color1.primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color1.primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(35),
                              ))),
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          color: Colors.lightBlue[50]),
                      suggestionsCallback: (pattern) {
                        List<String> matches = <String>[];
                        matches.addAll(li);
                        matches.retainWhere((s) {
                          return s
                              .toLowerCase()
                              .contains(pattern.toLowerCase());
                        });
                        return matches;
                      },
                      itemBuilder: (context, soe) {
                        return Card(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(soe.toString()),
                            ));
                      },
                      onSuggestionSelected: (suggestion) {
                        setState(() {
                          m.text = suggestion;
                          location = proo[li.indexOf(suggestion)];
                        });
                        print(suggestion);
                        print(li.contains(suggestion));
                        var r = li.indexOf(suggestion);
                      },
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Space',
                  style:
                  Style.textStyle18.copyWith(color: Color1.primaryColor),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: Slider(
                    min: 0,
                    max: 700,
                    divisions: 140,
                    activeColor: Color1.primaryColor,
                    value: spaceStart,
                    label: spaceStart.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        spaceStart = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Security',
                  style: Style.textStyle20,
                ),
                Checkbox(
                  value: s,
                  onChanged: (val) {
                    setState(() {
                      s = val!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Supply',
                  style: Style.textStyle20,
                ),
                Checkbox(
                  value: sup,
                  onChanged: (val) {
                    setState(() {
                      sup = val!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Heat',
                  style: Style.textStyle20,
                ),
                Checkbox(
                  value: heat,
                  onChanged: (val) {
                    setState(() {
                      heat = val!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'luxury',
                  style: Style.textStyle20,
                ),
                Checkbox(
                  value: lux,
                  onChanged: (val) {
                    setState(() {
                      lux = val!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Industrial',
                  style: Style.textStyle20,
                ),
                Checkbox(
                  value: ind,
                  onChanged: (val) {
                    setState(() {
                      ind = val!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: BlocBuilder<PriceCubit, PriceState>(
                builder: (context, state) {
                  if (state.status == PriceStatus.loading) {
                    return const CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      await BlocProvider.of<PriceCubit>(context).detail(
                          spaceStart.toInt(),
                          location['country'],
                          location['city'],
                          location["neighborhood"],
                          s,
                          sup,
                          lux,
                          ind,
                          heat);
                      if(state.status == PriceStatus.success) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            var p = BlocProvider.of<PriceCubit>(context).pro;
                            return AlertDialog(
                              title: Text(
                                'here is a price',
                                style: Style.textStyle20
                                    .copyWith(color: Color1.primaryColor),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'ok',
                                    style: Style.textStyle16.copyWith(
                                      fontSize: 14,
                                      color:
                                      Color1.primaryColor.withOpacity(.7),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Rent :   ${p['avrage rent']} \$'),
                                  Text('Price :   ${p['avrage purchase']} \$'),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      padding:
                      MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                      MaterialStateProperty.all(Color1.primaryColor),
                      foregroundColor:
                      MaterialStateProperty.all(Color1.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Price Property',
                      style: Style.textStyle16,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
