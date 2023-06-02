import 'package:flutter/material.dart';
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
      body: Container(
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
              text: 'Bronze',
              onChanged: (val) => setState(
                () {
                  bronze = val!;
                },
              ),
            ),
            SubscribeWidget(
              value: silver,
              text: 'Silver',
              onChanged: (val) => setState(
                () {
                  silver = val!;
                },
              ),
            ),
            SubscribeWidget(
              value: gold,
              text: 'Gold',
              onChanged: (val) => setState(
                () {
                  gold = val!;
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStateProperty.all(Color1.primaryColor),
                  foregroundColor: MaterialStateProperty.all(Color1.white),
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
            const Text(
              'Subscription kind : \n Bronze 10 property for \$30 , \n Silver 30 property for \$50 , \n Gold 50 property for \$99.99 \n or you can pay for one property you for \$10 for each ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
