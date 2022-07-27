import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      width: SizeConfig.screenWidth ,
      decoration: BoxDecoration(
        border :
     Border.all(color: kPrimaryColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(
            //     horizontal: getProportionateScreenWidth(20),
            //     vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Find cake or places",
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
