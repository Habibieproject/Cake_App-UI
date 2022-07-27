import 'package:cake_app/constants.dart';
import 'package:cake_app/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:cake_app/components/coustom_bottom_nav_bar.dart';
import 'package:cake_app/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
  automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: SearchField(),
        toolbarHeight: 100,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
