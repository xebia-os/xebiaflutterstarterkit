import 'package:xiflutter/dynamic_widget/curve_painter.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class CustomPaintWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map.containsKey('key') ? Key(map['key']) : null;
    Map<String, dynamic> painterMap = map['painter'];
    Map<String, dynamic> foregroundPainterMap = map['foregroundPainter'];
    String size = map['size'];
    bool isComplex = map.containsKey('isComplex') ? map['isComplex'] : false;
    bool willChange = map.containsKey('willChange') ? map['willChange'] : false;
    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    getPainter(Map<String, dynamic> mappedPainter) {
      String painterName =
          mappedPainter.containsKey('name') ? mappedPainter['name'] : null;
      switch (painterName) {
        case 'CurvePainter':
          return CurvePainter(
            context: buildContext,
            color: mappedPainter['color'],
            style: mappedPainter['style'],
            paths: mappedPainter['paths'],
          );
        default:
          break;
      }
    }

    var customPaintWidget = CustomPaint(
      key: key,
      painter: painterMap == null ? null : getPainter(painterMap),
      foregroundPainter: foregroundPainterMap == null
          ? null
          : getPainter(foregroundPainterMap),
      size: getSize(size),
      isComplex: isComplex,
      willChange: willChange,
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: customPaintWidget,
      );
    } else {
      return customPaintWidget;
    }
  }

  @override
  String get widgetName => "CustomPaint";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as CustomPaint;
    return <String, dynamic>{
      "type": widgetName,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => CustomPaint;
}
