import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'special_offers .dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
           
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
