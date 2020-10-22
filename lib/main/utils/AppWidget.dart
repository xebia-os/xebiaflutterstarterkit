import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'AppColors.dart';
import 'AppConstant.dart';

Widget text(
  String text, {
  var fontSize = textSizeLargeMedium,
  textColor = appTextColorSecondary,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}



void changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}

Widget commonCacheImageWidget(String url, double height, {double width, BoxFit fit}) {
  return CachedNetworkImage(
    placeholder: placeholderWidgetFn(),
    imageUrl: '$url',
    height: height,
    width: width,
    fit: fit,
  );
}

Widget settingItem(context, String text, {Function onTap, Widget detail, Widget leading, Color textColor, int textSize, double padding}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(child: leading ?? SizedBox(), width: 30, alignment: Alignment.center),
              leading != null ? 10.width : SizedBox(),
              Text(text, style: primaryTextStyle(size: textSize ?? 18, color: textColor ?? appStore.textPrimaryColor)).expand(),
            ],
          ).expand(),
          detail ?? Icon(Icons.arrow_forward_ios, size: 16, color: appStore.textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: appStore.appBarColor,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}

Widget appBar(BuildContext context, String title, {List<Widget> actions, bool showBack = true}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: appStore.appBarColor,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        : null,
    title: appBarTitleWidget(context, title),
    actions: actions,
  );
}

class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType, {@required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name, style: boldTextStyle()),
        trailing: showTrailing ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor) : null,
      ),
    );
  }
}

String convertDate(date) {
  try {
    return date != null ? DateFormat(dateFormat).format(DateTime.parse(date)) : '';
  } catch (e) {
    print(e);
    return '';
  }
}

class CustomTheme extends StatelessWidget {
  final Widget child;

  CustomTheme({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
              accentColor: appColorPrimary,
              backgroundColor: appStore.scaffoldBackground,
            )
          : ThemeData.light(),
      child: child,
    );
  }
}

Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

BoxConstraints dynamicBoxConstraints({double maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : applicationMaxWidth;
}

class ContainerX extends StatelessWidget {

  final BuildContext context;
  final double maxWidth;
  final Widget child;

  ContainerX({@required this.context, this.maxWidth, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: ConstrainedBox(
        constraints: dynamicBoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
      alignment: Alignment.topCenter,
    );
  }
}










class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

String platformName() {
  if (isLinux) return 'Linux';
  if (isWeb) return 'Web';
  return '';
}
