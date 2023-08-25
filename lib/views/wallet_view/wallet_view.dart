import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../../logic/wallet_cubit/wallet_cubit.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<WalletCubit>(context, listen: false).get();
    });
    super.initState();
  }

  var m = TextEditingController();
  var mm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color1.white,
          elevation: 0,
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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Color1.primaryColor,
                size: 28,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'make financial request',
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
                        BlocBuilder<
                            WalletCubit,
                            WalletState>(
                          builder: (context,
                              state) {
                            return TextButton(
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
                                if (m.text.isNotEmpty||mm.text.isNotEmpty) {
                                  await BlocProvider.of<WalletCubit>(context).add(mm.text, 'deposit', m.text);
                                  if (state
                                      .status ==
                                      WalletStatus
                                          .success) {
                                    Navigator.of(
                                        context)
                                        .pop();
                                    ScaffoldMessenger.of(
                                        context)
                                        .showSnackBar(
                                      const SnackBar(
                                          content:
                                          Text('add successfully')),
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
                            );
                          },
                        )
                      ],
                      content: Container(
                        height: 120,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                              const InputDecoration(
                                hintText:
                                'Write your password password',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color1
                                            .primaryColor,
                                        width:
                                        1)),
                              ),
                              controller: m,
                              cursorColor: Color1
                                  .primaryColor,
                            ),
                            TextFormField(
                              decoration:
                              const InputDecoration(
                                hintText:
                                'Write money',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color1
                                            .primaryColor,
                                        width:
                                        1)),
                              ),
                              controller: mm,
                              cursorColor: Color1
                                  .primaryColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
          title: Text(
            'your wallet',
            style: Style.textStyle22.copyWith(
                fontSize: (height / 34.3).floorToDouble(),
                fontWeight: FontWeight.w500),
          )),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          if (state.status == WalletStatus.loading ||
              state.status == WalletStatus.initial) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          if (BlocProvider.of<WalletCubit>(context).k == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          var q = BlocProvider.of<WalletCubit>(context).k;
          var i = q['wallet']['balance'];
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Your balance :',
                      style: Style.textStyle22.copyWith(
                          fontSize: (height / 34.3).floorToDouble(),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                        '$i \$',
                      style: Style.textStyle22.copyWith(
                          color: Color1.black,
                          fontSize: (height / 34.3).floorToDouble(),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'finicialRequest',
                    style: Style.textStyle20.copyWith(color: Color1.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                q['finicialRequests'].isNotEmpty
                    ? SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: q['finicialRequests'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var l = q['finicialRequests'];
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    l[index]['approvment_document'],
                                    textAlign: TextAlign.center,
                                    style: Style.textStyle16.copyWith(
                                        color: Color1.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${l[index]['balance']}  \$',
                                        textAlign: TextAlign.center,
                                        style: Style.textStyle16.copyWith(
                                            color: Color1.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        l[index]['type'].toString(),
                                        textAlign: TextAlign.center,
                                        style: Style.textStyle16.copyWith(
                                            color: Color1.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color1.primaryColor),
                                    ),
                                    icon: Icon(
                                      l[index]['status'] != 'pending'
                                          ? Icons.check
                                          : Icons.access_time_outlined,
                                      color: l[index]['status'] != 'pending'
                                          ? Colors.green
                                          : Color1.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Text(
                        'Their isn\'t any',
                        style: Style.textStyle22.copyWith(
                            color: Color1.black,
                            fontSize: (height / 45).floorToDouble(),
                            fontWeight: FontWeight.w400),
                      ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'transfer',
                    style: Style.textStyle20.copyWith(color: Color1.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                q['transfers'].isNotEmpty
                    ? SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: q['transfers'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var l = q['transfers'];
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    l[index]['ewallet_id'],
                                    textAlign: TextAlign.center,
                                    style: Style.textStyle16.copyWith(
                                        color: Color1.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${l[index]['balance']}  \$',
                                        textAlign: TextAlign.center,
                                        style: Style.textStyle16.copyWith(
                                            color: Color1.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color1.primaryColor),
                                    ),
                                    icon: Icon(
                                      l[index]['status'] != 'pending'
                                          ? Icons.check
                                          : Icons.access_time_outlined,
                                      color: l[index]['status'] != 'pending'
                                          ? Colors.green
                                          : Color1.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Text(
                        'Their isn\'t any',
                        style: Style.textStyle22.copyWith(
                            color: Color1.black,
                            fontSize: (height / 45).floorToDouble(),
                            fontWeight: FontWeight.w400),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool isInteger(value) =>
      value is int ;
}
