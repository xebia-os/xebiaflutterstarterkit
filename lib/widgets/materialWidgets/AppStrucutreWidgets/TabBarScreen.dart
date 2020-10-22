import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'TabBarWidgets/SimpleTabBar.dart';
import 'TabBarWidgets/IconTabBar.dart';

class TabBarScreen extends StatefulWidget {


  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  List<ListModel> tabBarType = [
    ListModel(name: 'Simple Tab Bar', widget: SimpleTabBar()),
    ListModel(name: 'Icon Tab Bar', widget: IconTabBar()),
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
      appBar: appBar(context, 'TabBar Example'),
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
    ));
  }
}
