import 'package:flutter/material.dart';

import 'Widget/property_view_details_body.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:PropertyDetailsViewBody() ,
    );
  }
}
