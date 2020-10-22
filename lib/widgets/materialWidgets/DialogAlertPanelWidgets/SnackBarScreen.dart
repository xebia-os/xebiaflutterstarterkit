import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class SnackBarScreen extends StatefulWidget {


  @override
  SnackBarScreenState createState() => SnackBarScreenState();
}

class SnackBarScreenState extends State<SnackBarScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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

  List<ListModel> example = [
    ListModel(name: 'Simple SnackBar'),
    ListModel(name: 'Action Snackbar'),
    ListModel(name: 'Custom SnackBar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'SnackBar'),
        key: scaffoldKey,
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('This is simple SnackBar',
                        style: primaryTextStyle(color: Colors.white)),
                  ));
                } else if (index == 1) {
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('This is SnackBar with Action',
                          style: primaryTextStyle(color: Colors.white)),
                      action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.white,
                          onPressed: () {
                            Fluttertoast.showToast(msg: 'Undo pressed');
                          }),
                    ),
                  );
                } else if (index == 2) {
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('This is custom SnackBar',
                        style: primaryTextStyle(color: Colors.white)),
                    backgroundColor: appColorPrimary,
                  ));
                }
              });
            }));
  }
}
