import 'package:flutter/gestures.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class SingleChildScrollWidgetParser extends WidgetParser {
  _setScrollDirection(String direction) {
    switch (direction.toLowerCase()) {
      case 'horizontal':
        return Axis.horizontal;
      default:
        return Axis.vertical;
    }
  }

  _setClipBehaviour(String clip) {
    switch (clip.toLowerCase()) {
      case 'antiAlias':
        return Clip.antiAlias;
      case 'saveLayer':
        return Clip.antiAliasWithSaveLayer;
      case 'hardEdge':
        return Clip.hardEdge;
      default:
        return Clip.none;
    }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String direction = map['direction'] ?? '';
    bool reverse = ((map['reverse'] ?? '').toString().toLowerCase() == 'true')
        ? true
        : false;
    bool primary = ((map['primary'] ?? '').toString().toLowerCase() == 'true')
        ? true
        : false;
    ScrollPhysics physics =
        ((map['scrollPhysics']).toString().toLowerCase() == 'true')
            ? ScrollPhysics()
            : null;
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    DragStartBehavior dragBehavior =
        (map['dragBehavior'].toString().toLowerCase() == 'down')
            ? DragStartBehavior.down
            : DragStartBehavior.start;
    String clip = map['clipBehavior'] ?? '';
    String restorationId = map['restorationId'] ?? '';

    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var singleChildScrollWidget = SingleChildScrollView(
      scrollDirection: _setScrollDirection(direction),
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      child: child,
      dragStartBehavior: dragBehavior,
      clipBehavior: _setClipBehaviour(clip),
      restorationId: restorationId,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: singleChildScrollWidget,
      );
    } else {
      return singleChildScrollWidget;
    }
  }

  @override
  String get widgetName => "SingleChildScrollView";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as SingleChildScrollView;
    var padding = realWidget.padding as EdgeInsets;
    return <String, dynamic>{
      "type": widgetName,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      //TODO: Container don't expose the width and height properties, so I don't know
      // how to export width and height properties.
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SingleChildScrollView;
}
