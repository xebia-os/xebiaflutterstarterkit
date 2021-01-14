import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class AppBarWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map['key'] ?? null;
    Map<String, dynamic> leadingMap = map['leading'];
    Widget leading = leadingMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(leadingMap, buildContext, listener);

    Map<String, dynamic> titleMap = map['title'];
    Widget title = titleMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(titleMap, buildContext, listener);

    Map<String, dynamic> flexibleSpaceMap = map['title'];
    Widget flexibleSpace = flexibleSpaceMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(
            flexibleSpaceMap, buildContext, listener);

    String elevation = map['elevation'];
    Color shadowColor = parseHexColor(map['shadowColor']);
    Color backgroundColor = parseHexColor(map['backgroundColor']);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var appBarWidget = AppBar(
      key: key,
      leading: leading,
      title: title,
      automaticallyImplyLeading: true,
      actions: null,
      flexibleSpace: flexibleSpace,
      elevation: elevation == null ? 0.0 : double.parse(elevation),
      shadowColor: shadowColor,
      backgroundColor: backgroundColor,
    );

    // if (listener != null && clickEvent != null) {
    //   return GestureDetector(
    //     onTap: () {
    //       listener.onClicked(clickEvent, buildContext);
    //     },
    //     child: appBarWidget,
    //   );
    // } else {
    return appBarWidget;
    //}
  }

  @override
  String get widgetName => "AppBar";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as AppBar;
    return <String, dynamic>{
      "type": widgetName,
      "leading": DynamicWidgetBuilder.export(realWidget.leading, buildContext)
    };
  }

  @override
  Type get widgetType => AppBar;
}
