import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class DrawerWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map['key'] ?? null;
    double elevation = map['elevation'] ?? 16.0;
    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);
    String semanticLabel = map['semanticLabel'];

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var drawerWidget = Drawer(
      key: key,
      elevation: elevation,
      child: child,
      semanticLabel: semanticLabel,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: drawerWidget,
      );
    } else {
      return drawerWidget;
    }
  }

  @override
  String get widgetName => "Drawer";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Drawer;
    return <String, dynamic>{
      "type": widgetName,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Drawer;
}
