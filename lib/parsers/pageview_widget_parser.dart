import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class PageViewWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") &&
        "horizontal" == map["scrollDirection"]) {
      scrollDirection = Axis.horizontal;
    }
    return PageView(
      scrollDirection: scrollDirection,
      reverse: map.containsKey("reverse") ? map["reverse"] : false,
      pageSnapping:
          map.containsKey("pageSnapping") ? map["pageSnapping"] : true,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "PageView";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as PageView;
    String scrollDirection = "vertical";
    if (realWidget.scrollDirection == Axis.horizontal) {
      scrollDirection = "horizontal";
    }
    var children = realWidget.childrenDelegate as SliverChildListDelegate;
    return <String, dynamic>{
      "type": "PageView",
      "scrollDirection": scrollDirection,
      "reverse": realWidget.reverse ?? false,
      "pageSnapping": realWidget.pageSnapping,
      "children":
          DynamicWidgetBuilder.exportWidgets(children.children, buildContext)
    };
  }

  @override
  Type get widgetType => PageView;
}
