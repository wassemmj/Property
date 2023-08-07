import 'package:flutter/material.dart';

import 'Widget/property_view_details_body.dart';

class PropertyDetailsView extends StatelessWidget {
  final int id;

  const PropertyDetailsView({Key? key, required this.id}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PropertyDetailsViewBody(id: id) ,
    );
  }
}
