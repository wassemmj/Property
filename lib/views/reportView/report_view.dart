import 'package:flutter/material.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  bool first = false;

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
          'Report',
          style: Style.textStyle22
              .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pretended to be someone else',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color1.black
                      ),
                    ),
                    Checkbox(
                        value: first,
                        activeColor: Color1.primaryColor,
                        shape: const CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            first = value!;
                          });
                        },
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Divider(color: Colors.grey),
                Text(
                  'Report cause: \n Bronze 10 property for \$30 , \n Silver 30 property for \$50 , \n Gold 50 property for \$99.99 \n or you can pay for one property you for \$10 for each ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
