import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';
import 'package:property_app/views/showMoreView/widget/show_more_card.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key, required this.from}) : super(key: key);

  final bool from;

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  int indexList = 0;
  int seList = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AllPropertyCubit>(context, listen: false).cat();
      List? q = BlocProvider.of<AllPropertyCubit>(context).property;
      qq = q?.where((element) => element['category']['type'] == BlocProvider.of<AllPropertyCubit>(context).types?[0]).toList();
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

  List? qq = [];
  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore'.toUpperCase(),
          style: Style.textStyle22,
        ),
        leading: widget.from
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color1.primaryColor,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : null,
        backgroundColor: Color1.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<AllPropertyCubit, AllPropertyState>(
        builder: (context, state) {
          if (state.status == AllPropertyStatus.loading || state.status == AllPropertyStatus.initial) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          var cat = BlocProvider.of<AllPropertyCubit>(context)
              .category;
          List<String> catName = [];
          for(int i =0 ;i<cat!.length;i++) {
            if(catName.contains(cat[i]['name'])) {

            }
            else {
              catName.add(cat[i]['name']);
            }
          }
          return Column(
            children: [
              SizedBox(
                height: (height / 17.3).floorToDouble(),
                child: ListView.builder(
                  itemCount: catName.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List? q = BlocProvider.of<AllPropertyCubit>(context).property;
                    qq = q?.where((element) => element['category']['type'] == BlocProvider.of<AllPropertyCubit>(context).types?[0]).toList();
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          indexList = index;
                          seList = 0;
                        });
                        await BlocProvider.of<AllPropertyCubit>(context,
                                listen: false)
                            .cattt(catName[index]);
                        qq = q?.where((element) => element['category']['type'] == BlocProvider.of<AllPropertyCubit>(context).types?[0]).toList();

                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: indexList == index
                              ? Color1.primaryColor
                              : Color1.white,
                          border: const Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Text(
                          catName[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                indexList == index ? Color1.white : Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: (height / 17.3).floorToDouble(),
                child: ListView.builder(
                  itemCount: BlocProvider.of<AllPropertyCubit>(context)
                      .types
                      ?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    List? q = BlocProvider.of<AllPropertyCubit>(context).property;
                    qq = q?.where((element) => element['category']['type'] == BlocProvider.of<AllPropertyCubit>(context).types?[seList]).toList();
                    return InkWell(
                      onTap: () {
                        setState(() {
                          seList = index;
                        });
                        qq = q?.where((element) => element['category']['type'] == BlocProvider.of<AllPropertyCubit>(context).types?[seList]).toList();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: seList == index
                              ? Color1.primaryColor
                              : Color1.white,
                          border: const Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Text(
                          BlocProvider.of<AllPropertyCubit>(context)
                              .types?[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: seList == index
                                ? Color1.white
                                : Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: qq?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if(qq!=null||qq!.isNotEmpty) {
                      var ll = qq?[index];
                      var p = ll['advert']['advertable'];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowMoreCard(
                              location: '${ll['location']['country']} , ${ll['location']['city']} ',
                              id: ll['id']??0,
                              price: ll['advert']['advertable_type']=='App\\Models\\Rent'? '${p['price_per_day']} per day':'${p['total_price']} ',
                              rent: ll['advert']['advertable_type']=='App\\Models\\Rent'? true:false,
                              space: '${ll['space']} M',
                              image: ll['image']==null ? ll['image'] : ll['image'][0],
                            ),
                          ],
                        ),
                      );
                    }

                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// BlocBuilder<AllPropertyCubit, AllPropertyState>(
//   builder: (context, state) {
//     if(state.status == AllPropertyStatus.loading) {
//       return const CircularProgressIndicator(
//         color: Color1.primaryColor,
//         strokeWidth: 1,
//       );
//     }
//     return FutureBuilder(
//       future: BlocProvider.of<AllPropertyCubit>(context).allProperty(),
//       builder: (context, snapshot) {
//         return Expanded(
//           child: ListView.builder(
//           itemCount: BlocProvider.of<AllPropertyCubit>(context).property!.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   ShowMoreCard(),
//                 ],
//               ),
//             );
//           },
//       ),
//         );
//       },
//     );
//   },
// ),

/*
const Text(
                  'Apartments',
                  style: TextStyle(color: Color1.primaryColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 4) {
                        return const ExploreLastItem();
                      }
                      return const ExploreFirstItem();
                    },
                  ),
                ),
 */
