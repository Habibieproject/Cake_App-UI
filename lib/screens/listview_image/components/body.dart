import 'dart:convert';

import 'package:cake_app/Config/constants.dart';
import 'package:cake_app/constants.dart';
import 'package:cake_app/screens/home/components/search_field.dart';
import 'package:cake_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> images = <String>[];

  Future<void> fillList() async {
    final url = Uri.parse(EndPoints.cake);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    setState(() {
      Map<String, dynamic> item;
      for (item in json) {
        images.add(item['download_url']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
          child: Expanded(
            child: Column(children: [
                  SizedBox(
            height: 160,
            child: Stack(children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                color: kPrimaryColor,
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30)),
                    child: SearchField(),
                  )),
            ]),
                  ),
                   Column(
                              children: [
                                Positioned(
                                  top: 100,
                                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30)),
                    child: Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1 / 1),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Container(
                                color: Colors.white,
                                child: Image.network(images[index],
                                    fit: BoxFit.cover)),
                          );
                        },
                      ),
                    ),
                                  ),
                                ),
                              ],
                    ),
                ]  )
                ,
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }
}
