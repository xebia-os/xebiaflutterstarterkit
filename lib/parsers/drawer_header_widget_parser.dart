import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class DrawerHeaderWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map['key'] ?? null;
    EdgeInsetsGeometry margin = parseEdgeInsetsGeometry(map['margin']);
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    Map<String, dynamic> decoration = map['decoration'];
    Map<String, dynamic> duration = map['duration'] ?? null;
    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    setupDecoration() {
      switch (decoration['name']) {
        case 'BoxDecoration':
          return BoxDecoration(
            color: setThemeColor(buildContext, decoration['color']),
            borderRadius: decoration.containsKey('borderRadius')
                ? BorderRadius.circular(decoration['borderRadius'])
                : null,
          );
        default:
          return null;
      }
    }

    var drawerHeaderWidget = DrawerHeader(
      key: key,
      decoration: decoration == null ? null : setupDecoration(),
      margin: margin == null ? const EdgeInsets.only(bottom: 8.0) : margin,
      padding: padding == null
          ? const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0)
          : padding,
      duration: duration == null
          ? const Duration(milliseconds: 250)
          : getDuration(type: duration['type'], value: duration['value']),
      curve: getCurves(map['curve']),
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: drawerHeaderWidget,
      );
    } else {
      return drawerHeaderWidget;
    }
  }

  @override
  String get widgetName => "DrawerHeader";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as DrawerHeader;
    var padding = realWidget.padding as EdgeInsets;
    var margin = realWidget.margin as EdgeInsets;
    return <String, dynamic>{
      "type": widgetName,
      "margin": margin != null
          ? "${margin.left},${margin.top},${margin.right},${margin.bottom}"
          : null,
      //TODO: Container don't expose the width and height properties, so I don't know
      // how to export width and height properties.
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => DrawerHeader;
}
