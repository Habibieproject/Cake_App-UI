import 'package:flutter/material.dart';

import 'components/body.dart';

class RegisterSuccessScreen extends StatelessWidget {
  static String routeName = "/register_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Register Success"),
      ),
      body: Body(),
    );
  }
}
