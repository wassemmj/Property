import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/subscribe_cubit/subscribe_cubit.dart';
import 'package:property_app/views/subscriptionView/widget/subscribe_widget.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  bool bronze = false;
  bool silver = false;
  bool gold = false;
  var id = 0;

  var m = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<SubscribeCubit>(context, listen: false).get();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color1.primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Subscription',
          style: Style.textStyle22
              .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<SubscribeCubit, SubscribeState>(
          builder: (context, state) {
            if (state.status == SubscribeStatus.loading ||
                state.status == SubscribeStatus.initial) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Color1.primaryColor,
                    strokeWidth: 1,
                  ));
            }
            if(BlocProvider.of<SubscribeCubit>(context).pro == null) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Color1.primaryColor,
                    strokeWidth: 1,
                  ));
            }
            var p = BlocProvider.of<SubscribeCubit>(context).pro;
            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upgrade your account to be a premium member in property house to be able to add property,',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Subscription kind',
                    textAlign: TextAlign.start,
                    style: Style.textStyle20.copyWith(
                      color: Color1.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SubscribeWidget(
                    value: bronze,
                    text: p[0]['name'],
                    onChanged: (val) => setState(
                      () {
                        id = p[0]['id'];
                        bronze = val!;
                        silver = false;
                        gold = false;
                      },
                    ),
                  ),
                  SubscribeWidget(
                    value: silver,
                    text: p[1]['name'],
                    onChanged: (val) => setState(
                      () {
                        id = p[1]['id'];
                        bronze = false;
                        silver = val!;
                        gold = false;
                      },
                    ),
                  ),
                  SubscribeWidget(
                    value: gold,
                    text: p[2]['name'],
                    onChanged: (val) => setState(
                      () {
                        id = p[2]['id'];
                        bronze = false;
                        silver = false;
                        gold = val!;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Enter your password',
                                style: Style.textStyle20
                                    .copyWith(color: Color1.primaryColor),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'cancel',
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
                                BlocBuilder<SubscribeCubit, SubscribeState>(
                                  builder: (context, state) {
                                    return TextButton(
                                      child: Text(
                                        'Approve',
                                        style: Style.textStyle16.copyWith(
                                          fontSize: 14,
                                          color: Color1.primaryColor
                                              .withOpacity(.7),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (m.text.isNotEmpty) {
                                          await BlocProvider.of<SubscribeCubit>(
                                                  context)
                                              .subscribe(id, m.text);
                                          if (state.status ==
                                              SubscribeStatus.success) {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'subscribe successfully')),
                                            );
                                          }
                                          if (state.status ==
                                              SubscribeStatus.error) {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'you don\'t have enough money')),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'this filled is required')),
                                          );
                                        }
                                      },
                                    );
                                  },
                                )
                              ],
                              content: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Write here',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color1.primaryColor,
                                          width: 1)),
                                ),
                                controller: m,
                                maxLength: 100,
                                maxLines: 3,
                                cursorColor: Color1.primaryColor,
                              ),
                            );
                          },
                        );
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
                        'Subscribe',
                        style: Style.textStyle16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.grey),
                  Text(
                    'Subscription kind : \n ${p[0]['name']} ${p[0]['count']} property for \$${p[0]['price']} , \n  ${p[1]['name']} ${p[1]['count']} property for \$${p[1]['price']}, \n ${p[2]['name']} ${p[2]['count']} property for \$${p[2]['price']} ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
