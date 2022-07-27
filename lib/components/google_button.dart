import 'package:cake_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(56),
        width: getProportionateScreenWidth(330),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          border: Border.all(
                      color: kPrimaryColor,
                      width: 1.0,
                      style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon!, height: 25,),
            Text (" Login with Google", style: TextStyle(color: kPrimaryColor,
            fontSize: 22),)
          ],
        ),
      ),
    );
  }
}
