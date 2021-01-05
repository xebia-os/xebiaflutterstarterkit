import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class ConstrainedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map.containsKey('key') ? Key(map['key']) : null;
    double minWidth = map.containsKey('minWidth') ? map['minWidth'] : 0.0;
    double maxWidth = map.containsKey('maxWidth') ? map['maxWidth'] : 0.0;
    double minHeight = map.containsKey('minHeight') ? map['minHeight'] : 0.0;
    double maxHeight = map.containsKey('maxHeight') ? map['maxHeight'] : 0.0;

    double mediaQueryWidth = map['mediaQueryWidth'];
    double mediaQueryHeight = map['mediaQueryHeight'];

    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

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

    var constrainedBoxWidget = ConstrainedBox(
      key: key,
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: mediaQueryWidth != null ? getMediaQueryWidth() : maxWidth,
        minHeight: minHeight,
        maxHeight: mediaQueryHeight != null ? getMediaQueryHeight() : maxHeight,
      ),
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: constrainedBoxWidget,
      );
    } else {
      return constrainedBoxWidget;
    }
  }

  @override
  String get widgetName => "ConstrainedBox";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Container;
    return <String, dynamic>{
      "type": widgetName,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => ConstrainedBox;
}
