import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/model/AppModel.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppConstant.dart';
import 'package:xiflutter/main/utils/AppDataProvider.dart';
import 'package:xiflutter/main/utils/AppImages.dart';
import 'package:xiflutter/main/utils/AppStrings.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'ScreenListing.dart';
import 'ThemeList.dart';

class Launcher extends StatefulWidget {


  @override
  LauncherState createState() => LauncherState();
}

class LauncherState extends State<Launcher> with TickerProviderStateMixin, AfterLayoutMixin<Launcher> {
  var selectedTab = 0;

  PageController _controller = PageController(initialPage: 0, keepPage: false);

  @override
  void afterFirstLayout(BuildContext context) async {
    if (await getInt(appOpenCount) >= 5) {
      setInt(appOpenCount, 0);
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.black);
    List<Color> colors = [appCat1, appCat2, appCat3];

    var width = MediaQuery.of(context).size.width;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Widget tabItem(String name, int pos, {var isRight = false}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(pos);
            selectedTab = pos;
          });
        },
        child: Container(
          child: Text(name, style: boldTextStyle(color: selectedTab == pos ? appColorPrimaryDark : appStore.textPrimaryColor, size: 18)),
          alignment: Alignment.center,
          height: 50,
          decoration: selectedTab == pos
              ? BoxDecoration(color: appStore.appColorPrimaryLightColor, borderRadius: isRight ? BorderRadius.only(topLeft: Radius.circular(16)) : BorderRadius.only(topRight: Radius.circular(16)))
              : BoxDecoration(),
        ),
      );
    }

    Widget category(Color color, String img, String name, {bool isNew = false, String type = 'New', @required Function onTap}) {
      return Container(
        width: 145,
        height: 110,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 140,
              height: 100,
              margin: EdgeInsets.only(right: 16),
              decoration: boxDecorationRoundedWithShadow(4, backgroundColor: color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(img, width: width / 12, height: width / 12, color: Colors.white),
                  Text('$name', style: boldTextStyle(color: Colors.white), maxLines: 2, textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ).onTap(() => onTap()),
      );
    }

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: FutureBuilder<AppTheme>(
        future: getAllAppsAndThemes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 220.0,
                    floating: false,
                    backgroundColor: appStore.scaffoldBackground,
                    forceElevated: innerBoxIsScrolled,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    actions: [

                    ],
                    title: innerBoxIsScrolled ? Text(titleHeading, style: boldTextStyle(size: 15)) : null,
                    bottom: innerBoxIsScrolled
                        ? PreferredSize(
                            preferredSize: Size(context.width(), 80),
                            child: Container(
                              height: 80,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 60,
                                    margin: EdgeInsets.only(right: 12),
                                    padding: EdgeInsets.all(16),
                                    child: Image.asset(app_dashboard, color: Colors.white),
                                    decoration: boxDecoration(bgColor: colors[0], radius: 4),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: <Widget>[
                                        Container(
                                          width: width,
                                          height: 60,
                                          padding: EdgeInsets.only(left: 16, right: 16),
                                          margin: EdgeInsets.only(right: width / 28),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('Default Theme', style: boldTextStyle(), maxLines: 2),
                                                ],
                                              ).expand(),
                                            ],
                                          ),
                                          decoration: boxDecoration(bgColor: appStore.scaffoldBackground, radius: 4, showShadow: true),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                                          decoration: BoxDecoration(color: colors[0], shape: BoxShape.circle),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ).onTap(() {
                            }),
                          )
                        : null,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 16),
                            Text(titleHeading, style: boldTextStyle(size: 35)).paddingOnly(top: 16, left: 100, right: 16),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              padding: EdgeInsets.all(16),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  category(appCat4, app_dashboard, snapshot.data.widgets.name, isNew: true, type: snapshot.data.widgets.type, onTap: () {
                                    ScreenListing(snapshot.data.widgets).launch(context);
                                  }),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                margin: EdgeInsets.only(top: 24),
                width: context.width(),

              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error.toString()}", style: primaryTextStyle());
          }
          return CircularProgressIndicator().center();
        },
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: appStore.scaffoldBackground,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(padding: EdgeInsets.only(top: 8, right: 16), child: Icon(Icons.close, color: appStore.iconColor)),
                ),
              ),
              Image.asset('images/app/app_icon.png', height: 100),
              Text("Download the source code", style: boldTextStyle(size: 20)).fit(),
              SizedBox(height: 6),
              Text(LoremText, style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
              SizedBox(height: 24),
              RaisedButton(
                onPressed: () {
                  finish(context);
                },
                child: Text('Download', style: primaryTextStyle(color: white)),
                color: appColorPrimary,
              ).paddingOnly(bottom: 24)
            ],
          ),
        ),
      ),
    );
  }
}
