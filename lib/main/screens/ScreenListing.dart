import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xiflutter/main/model/AppModel.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppImages.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'ThemeList.dart';

class ScreenListing extends StatefulWidget {
  static String tag = "screen";
  final XITheme xiTheme;

  ScreenListing(this.xiTheme);

  @override
  ScreenListingState createState() => ScreenListingState();
}

class ScreenListingState extends State<ScreenListing> {
  var width;
  var height;
  var selectedTab = 0;
  List<XITheme> list = List<XITheme>();
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void initState() {
    super.initState();
    if (widget.xiTheme.sub_kits != null) {
      list.addAll(widget.xiTheme.sub_kits);
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(
        context,
        widget.xiTheme.title_name ?? widget.xiTheme.name,
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: widget.xiTheme.show_cover ? Image.asset(app_dashboard, height: height / 4) : null,
            ),
            ThemeList(list),
          ],
        ),
      ),
    );
  }
}
