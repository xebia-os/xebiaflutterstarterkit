import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/model/AppModel.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppImages.dart';
import 'package:xiflutter/main/utils/AppStrings.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import 'ScreenListing.dart';

class ThemeList extends StatefulWidget {
  final List<XITheme> list;

  ThemeList(this.list);

  @override
  ThemeListState createState() => ThemeListState();
}

class ThemeListState extends State<ThemeList> {
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.list.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 400),
            child: SlideAnimation(
              verticalOffset: height * 0.5,
              horizontalOffset: width * 0.5,
              child: GestureDetector(
                onTap: () {
                  if (appStore.isDarkModeOn) {
                    appStore.toggleDarkMode(value: widget.list[index].darkThemeSupported.validate());
                  }

                  if (widget.list[index].sub_kits == null || widget.list[index].sub_kits.isEmpty) {
                    if (widget.list[index].widget != null) {
                      log('Tag ${widget.list[index].widget.key}');

                      widget.list[index].widget.launch(context);
                    } else {
                    }
                  } else {
                    ScreenListing(widget.list[index]).launch(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            Container(
                              width: width,
                              height: 80,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              margin: EdgeInsets.only(right: width / 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('${widget.list[index].name.validate()}', style: boldTextStyle(), maxLines: 2),
                                      Text(
                                        widget.list[index].title_name.validate(),
                                        style: secondaryTextStyle(),
                                      ).visible(widget.list[index].title_name.validate().isNotEmpty),
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
                              decoration: BoxDecoration(color: colors[index % colors.length], shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
