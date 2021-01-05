import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class RaisedButtonParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    double width = map.containsKey('width') ? parseWidth(map['width']) : null;
    EdgeInsetsGeometry superPadding = map.containsKey('superPadding')
        ? parseEdgeInsetsGeometry(map['superPadding'])
        : EdgeInsets.all(0);

    var raisedButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: parseBorderRadius(map["borderRadius"]),
      ),
      color: map.containsKey('color')
          ? setThemeColor(buildContext, map['color'])
          : null,
      disabledColor: map.containsKey('disabledColor')
          ? parseHexColor(map['disabledColor'])
          : null,
      disabledElevation:
          map.containsKey('disabledElevation') ? map['disabledElevation'] : 0.0,
      disabledTextColor: map.containsKey('disabledTextColor')
          ? parseHexColor(map['disabledTextColor'])
          : null,
      elevation: map.containsKey('elevation') ? map['elevation'] : 0.0,
      padding: map.containsKey('padding')
          ? parseEdgeInsetsGeometry(map['padding'])
          : null,
      splashColor: map.containsKey('splashColor')
          ? parseHexColor(map['splashColor'])
          : null,
      textColor:
          map.containsKey('textColor') ? parseHexColor(map['textColor']) : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
      onPressed: () {
        listener.onClicked(clickEvent, buildContext);
      },
    );

    if (width != null) {
      return Padding(
        padding: superPadding,
        child: Container(
          width: width,
          child: raisedButton,
        ),
      );
    }

    return raisedButton;
  }

  @override
  String get widgetName => "RaisedButton";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as RaisedButton;
    var padding = realWidget.padding as EdgeInsets;

    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "disabledColor": realWidget.disabledColor != null
          ? realWidget.disabledColor.value.toRadixString(16)
          : null,
      "disabledElevation": realWidget.disabledElevation,
      "disabledTextColor": realWidget.disabledTextColor != null
          ? realWidget.disabledTextColor.value.toRadixString(16)
          : null,
      "elevation": realWidget.elevation,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "splashColor": realWidget.splashColor != null
          ? realWidget.splashColor.value.toRadixString(16)
          : null,
      "textColor": realWidget.textColor != null
          ? realWidget.textColor.value.toRadixString(16)
          : null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => RaisedButton;
}
