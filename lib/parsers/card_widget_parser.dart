import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class CardWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Color color = setThemeColor(buildContext, map['color']);
    Color shadowColor = parseHexColor(map['shadowColor']);
    double elevation = map['elevation'] ?? null;
    bool borderOnForeground = map.containsKey('borderOnForeground')
        ? map['borderOnForeground']
        : true;
    bool semanticContainer =
        map.containsKey('semanticContainer') ? map['semanticContainer'] : true;
    EdgeInsetsGeometry margin = parseEdgeInsetsGeometry(map['margin']);
    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var cardWidget = Card(
      color: color,
      shadowColor: shadowColor,
      elevation: elevation,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: parseClip(map['clipBehavior']),
      semanticContainer: semanticContainer,
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: cardWidget,
      );
    } else {
      return cardWidget;
    }
  }

  @override
  String get widgetName => "Card";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Card;
    var margin = realWidget.margin as EdgeInsets;
    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "margin": margin != null
          ? "${margin.left},${margin.top},${margin.right},${margin.bottom}"
          : null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Card;
}
