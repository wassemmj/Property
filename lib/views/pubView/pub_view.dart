import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../../logic/request_cubit/request_cubit.dart';
import '../PropertyDetailsView/property_details_view.dart';

class PubView extends StatefulWidget {
  const PubView({Key? key}) : super(key: key);

  @override
  State<PubView> createState() => _PubViewState();
}

class _PubViewState extends State<PubView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<RequestCubit>(context, listen: false).getPubRequest();
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

  var m = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'Property',
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
          var waitingProperty = BlocProvider.of<RequestCubit>(context).pRequest;
          if(waitingProperty==null) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Color1.primaryColor,
                  strokeWidth: 1,
                ));
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  waitingProperty.isNotEmpty
                      ? Container()
                      : const SizedBox(
                    height: 350,
                  ),
                  waitingProperty.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    child: ListView.builder(
                        itemCount: waitingProperty.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          print(waitingProperty.length);
                          var r = waitingProperty[index]['requests'];
                          var a = waitingProperty[index]['advert'];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (_) => PropertyDetailsView(id: a['id'])));
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
                                                  '${a['advertable_type'].toString().substring(11)} , ${a['advertable_type'] == "App\\Models\\purchase" ? a['advertable']['total_price']  : a['advertable']['price_per_day'] } \$ price',
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
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () async{
                                        await BlocProvider.of<RequestCubit>(context).delete(a['id']);
                                        if(state.status == RequestStatus.success) {
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Property deleted')));
                                        }
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
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              r.isNotEmpty ? SizedBox(
                                height: 80,
                                child: r.isNotEmpty ? ListView.builder(
                                  itemCount: r.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
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
                                              r[index]['details'],
                                              textAlign: TextAlign.center,
                                              style: Style.textStyle16.copyWith(
                                                color: Color1.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: r[index]['status'] != 'pending' ? IconButton(
                                                onPressed: () {},
                                                icon:  Icon(r[index]['status'] == 'confirmed'
                                                    ? Icons.check
                                                    : Icons.cancel_outlined,
                                                  color: r[index]['status'] == 'confirmed'
                                                      ? Colors.green
                                                      :  Colors.red,
                                                ),
                                              ): Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      await BlocProvider.of<RequestCubit>(context).accept(r[index]['id'], a['id']);
                                                    },
                                                    icon:  const Icon(Icons.check,color: Colors.green,),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  IconButton(
                                                    onPressed: () {
                                                      showDialog(context: context, builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'write here',
                                                            style: Style
                                                                .textStyle20
                                                                .copyWith(
                                                                color: Color1
                                                                    .primaryColor),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: Text(
                                                                'cancel',
                                                                style: Style
                                                                    .textStyle16
                                                                    .copyWith(
                                                                  fontSize: 14,
                                                                  color: Color1
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                      .7),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                'Approve',
                                                                style: Style
                                                                    .textStyle16
                                                                    .copyWith(
                                                                  fontSize:
                                                                  14,
                                                                  color: Color1
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                      .7),
                                                                ),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (m.text
                                                                    .isNotEmpty) {
                                                                  await BlocProvider.of<RequestCubit>(context).reject(r[index]['id'], a['id'], m.text);
                                                                  if(state.status == RequestStatus.success) {
                                                                    ScaffoldMessenger.of(
                                                                        context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                          content:
                                                                          Text('reject successfully')),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                      context)
                                                                      .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                        Text('this filled is required')),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                          content: Container(
                                                            child: TextFormField(
                                                              decoration:
                                                              const InputDecoration(
                                                                hintText:
                                                                'Write why..',
                                                                focusedBorder: UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Color1
                                                                            .primaryColor,
                                                                        width:
                                                                        1)),
                                                              ),
                                                              controller: m,
                                                              maxLength: 100,
                                                              maxLines: 3,
                                                              cursorColor: Color1
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        );
                                                      },);
                                                    },
                                                    icon:  const Icon(Icons.cancel_outlined, color: Colors.red,),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ) : Container(),
                              ):Container(),
                              const SizedBox(height: 20,)
                            ],
                          );
                        }),
                  )
                      : const Center(
                    child: Text(
                      'There is not any property requested',
                      textAlign: TextAlign.center,
                      style: Style.textStyle16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
