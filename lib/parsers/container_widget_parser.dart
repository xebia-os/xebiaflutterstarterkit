import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Alignment alignment = parseAlignment(map['alignment']);
    Color color = parseHexColor(map['color']);
    BoxConstraints constraints = parseBoxConstraints(map['constraints']);
    EdgeInsetsGeometry margin = parseEdgeInsetsGeometry(map['margin']);
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    double mediaQueryHeight = map["mediaQueryHeight"];
    double mediaQueryWidth = map["mediaQueryWidth"];
    Map<String, dynamic> decoration = map['decoration'];
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

    getMediaQueryWidth() {
      return map.containsKey('mediaQueryWidth')
          ? MediaQuery.of(buildContext).size.width * map["mediaQueryWidth"]
          : null;
    }

    getMediaQueryHeight() {
      return map.containsKey('mediaQueryHeight')
          ? MediaQuery.of(buildContext).size.height * map["mediaQueryHeight"]
          : null;
    }

    var containerWidget = Container(
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration == null ? null : setupDecoration(),
      margin: margin,
      width: mediaQueryWidth != null
          ? getMediaQueryWidth()
          : parseWidth(map['width']),
      height: mediaQueryHeight != null ? getMediaQueryHeight() : map['height'],
      constraints: constraints,
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: containerWidget,
      );
    } else {
      return containerWidget;
    }
  }

  @override
  String get widgetName => "Container";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Container;
    var padding = realWidget.padding as EdgeInsets;
    var margin = realWidget.margin as EdgeInsets;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment)
          : null,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "margin": margin != null
          ? "${margin.left},${margin.top},${margin.right},${margin.bottom}"
          : null,
      //TODO: Container don't expose the width and height properties, so I don't know
      // how to export width and height properties.
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Container;
}
