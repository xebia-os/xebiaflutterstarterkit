import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class FittedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    return FittedBox(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])
          : Alignment.center,
      fit: map.containsKey("fit") ? parseBoxFit(map["fit"]) : BoxFit.contain,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "FittedBox";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as FittedBox;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment)
          : null,
      "fit": realWidget.fit != null
          ? exportBoxFit(realWidget.fit)
          : BoxFit.contain,
      "child": DynamicWidgetBuilder.export(realWidget, buildContext)
    };
  }

  @override
  Type get widgetType => FittedBox;
}
