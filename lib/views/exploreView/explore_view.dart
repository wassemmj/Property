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
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

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
          return Column(
            children: [
              SizedBox(
                height: (height / 17.3).floorToDouble(),
                child: ListView.builder(
                  itemCount: BlocProvider.of<AllPropertyCubit>(context)
                      .category
                      ?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          indexList = index;
                        });
                        await BlocProvider.of<AllPropertyCubit>(context,
                                listen: false)
                            .type(BlocProvider.of<AllPropertyCubit>(context)
                                .category![index]['name']);
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
                          BlocProvider.of<AllPropertyCubit>(context)
                              .category![index]["name"],
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
                    return InkWell(
                      onTap: () {
                        setState(() {
                          seList = index;
                        });
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
                              .types?[index]['type'],
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
                  itemCount: BlocProvider.of<AllPropertyCubit>(context)
                      .property
                      ?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var ll = BlocProvider.of<AllPropertyCubit>(context)
                        .property?[index]['property'];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowMoreCard(
                            location: '${ll['location_id']??0}',
                            id: ll['id']??0,
                          ),
                        ],
                      ),
                    );
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
