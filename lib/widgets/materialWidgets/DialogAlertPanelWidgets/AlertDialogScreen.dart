import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class AlertDialogScreen extends StatefulWidget {


  @override
  AlertDialogScreenState createState() => AlertDialogScreenState();
}

class AlertDialogScreenState extends State<AlertDialogScreen> {
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
    ListModel(name: 'Simple Alert Dialog'),
    ListModel(name: 'Confirmation Alert Dialog with Action Button'),
    ListModel(name: 'Warning Alert Dialog'),
  ];

  @override
  Widget build(BuildContext context) {
    AlertDialog mAlertItem1 = AlertDialog(
      backgroundColor: appStore.scaffoldBackground,
      title: Text(
        "Alert Title",
        style: boldTextStyle(color: appStore.textPrimaryColor),
      ),
      content: Text(
        "Alert Message",
        style: secondaryTextStyle(color: appStore.textSecondaryColor),
      ),
      actions: [],
    );

    AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: appStore.scaffoldBackground,
      title: Text("Confirmation", style: boldTextStyle(color: appStore.textPrimaryColor)),
      content: Text(
        "Are you sure you want to logout?",
        style: secondaryTextStyle(color: appStore.textSecondaryColor),
      ),
      actions: [
        FlatButton(
          child: Text(
            "Yes",
            style: primaryTextStyle(color: appColorPrimary),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("No", style: primaryTextStyle(color: appColorPrimary)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );


    AlertDialog mAlertItem3 = AlertDialog(
      backgroundColor: appStore.scaffoldBackground,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 120, color: appColorPrimary),
                Column(
                  children: [
                    Icon(Icons.warning, color: white, size: 32),
                    8.height,
                    Text('Error', textAlign: TextAlign.center, style: boldTextStyle(color: white, size: 18)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text("Something Went Wrong", style: secondaryTextStyle()),
            ),
            16.height,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: boxDecoration(bgColor: appColorPrimary, radius: 10),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: text("Try again", textColor: white, fontSize: 16.0),
              ),
            ),
            16.height,
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );

    return Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Alert Dialog'),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem1;
                    },
                  );
                } else if (index == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem2;
                    },
                  );
                } else if (index == 2) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return mAlertItem3;
                    },
                  );
                }
              });
            }));
  }
}
