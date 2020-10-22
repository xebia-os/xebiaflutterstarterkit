import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import 'BottomNavigationWidgets/IconLabelBottomNav.dart';
import 'BottomNavigationWidgets/ShiftingLabelBottomNav.dart';

class BottomNavigationScreen extends StatefulWidget {


  @override
  BottomNavigationScreenState createState() =>
      BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<ListModel> tabBarType = [
    ListModel(
        name: 'Bottom Navigation bar with fixed icon and label',
        widget: IconLabelBottomNav()),
    ListModel(
        name: 'Bottom Navigation bar shifiting',
        widget: ShiftingLabelBottomNav()),
  ];
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Bottom Navigation Bar'),
        body: ListView.builder(
          itemCount: tabBarType.length,
          itemBuilder: ((BuildContext context, index) {
            return ExampleItemWidget(
              tabBarType[index],
              onTap: () {
                tabBarType[index].widget.launch(context);
              },
            );
          }),
        ),
      ),
    );
  }
}
