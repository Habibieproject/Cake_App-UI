import 'package:cake_app/components/already_account_text.dart';
import 'package:cake_app/constants.dart';
import 'package:cake_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:cake_app/components/no_account_text.dart';
import 'package:cake_app/components/google_button.dart';
import '../../../size_config.dart';

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
                      "Sign Up",
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
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                
                SizedBox(height: getProportionateScreenHeight(20)),
                AlreadyAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
