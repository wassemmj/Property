import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/request_cubit/request_cubit.dart';
import 'package:property_app/views/exploreView/explore_view.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../PropertyDetailsView/property_details_view.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({Key? key}) : super(key: key);

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RequestCubit>(context, listen: false)
          .getUserRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'waiting Request',
          style: Style.textStyle22
              .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) {
          if ((state.status == RequestStatus.loading ||
              state.status == RequestStatus.initial)) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          var waitingProperty = BlocProvider.of<RequestCubit>(context).uRequest;
          if(waitingProperty==null) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Color1.primaryColor,
                  strokeWidth: 1,
                ));
          }
          return SafeArea(
            child: Column(
              children: [
                waitingProperty['req'].isNotEmpty
                    ? Container()
                    : const SizedBox(
                        height: 350,
                      ),
                waitingProperty['req'].isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: ListView.builder(
                            itemCount: waitingProperty['req'].length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var w = waitingProperty['req'][index];
                              var ll = w["advert"];
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_) => PropertyDetailsView(id: ll['id'])));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black26,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${ll['advertable_type'].toString().substring(11)} , ${ll['advertable_type'] == "App\\Models\\purchase" ? ll['advertable']['total_price']  : ll['advertable']['price_per_day'] } \$ price',
                                                style: Style.textStyle20
                                                    .copyWith(color: Color1.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'about property ',
                                                style: Style.textStyle18
                                                    .copyWith(color: Color1.primaryColor,fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(80, 82, 82, 0.4),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      margin: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            w['details'].toString(),
                                            textAlign: TextAlign.center,
                                            style: Style.textStyle16.copyWith(
                                              color: Color1.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color1.primaryColor),
                                                ),
                                                icon: Icon(
                                                  w['status'] != 'pending'
                                                      ? Icons.check
                                                      : Icons.access_time_outlined,
                                                  color: w['status'] != 'pending'
                                                      ? Colors.green
                                                      : Color1.primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () async{
                                                  await BlocProvider.of<RequestCubit>(context).deleteRequest(w['id']);
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color1.primaryColor),
                                                ),
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 20,)
                                ],
                              );
                            }),
                      )
                    : const Center(
                        child: Text(
                          'There is not any property you request,\n Add Some Property',
                          textAlign: TextAlign.center,
                          style: Style.textStyle16,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ExploreView(from: true),
          ));
        },
        tooltip: 'add some property to application',
        backgroundColor: Color1.primaryColor.withOpacity(0.7),
        child: const Icon(
          Icons.home_outlined,
          color: Color1.white,
        ),
      ),
    );
  }
}
