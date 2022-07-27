import 'package:cake_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cake_app/components/no_account_text.dart';
import 'package:cake_app/components/google_button.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet consectetur \nadipiscing elit",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Or", style: TextStyle(fontSize: 18),),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleButton(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
