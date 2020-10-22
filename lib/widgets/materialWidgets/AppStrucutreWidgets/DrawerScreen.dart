import 'package:flutter/material.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/DrawerWidgets/SimpleDrawerScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/DrawerWidgets/CustomDrawerScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class DrawerScreen extends StatefulWidget {


  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  List<ListModel> example = [
    ListModel(
      name: 'Simple Drawer',
      widget: SimpleDrawerScreen(),
    ),
    ListModel(
      name: 'Shaped Drawer',
      widget: CustomDrawerScreen(),
    ),
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
          appBar: appBar(context, 'Drawer Example'),
          body: ListView.builder(
              itemCount: example.length == null ? 0 : example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(
                  example[index],
                  onTap: () {
                    example[index].widget.launch(context);
                  },
                );
              })),
    );
  }
}
