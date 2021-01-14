library dynamic_widget;

import 'dart:convert';

import 'package:xiflutter/parsers/align_widget_parser.dart';
import 'package:xiflutter/parsers/app_bar_widget_parser.dart';
import 'package:xiflutter/parsers/aspectratio_widget_parser.dart';
import 'package:xiflutter/parsers/baseline_widget_parser.dart';
import 'package:xiflutter/parsers/bottom_navigation_bar_widget_parser.dart';
import 'package:xiflutter/parsers/button_widget_parser.dart';
import 'package:xiflutter/parsers/card_widget_parser.dart';
import 'package:xiflutter/parsers/center_widget_parser.dart';
import 'package:xiflutter/parsers/cliprrect_widget_parser.dart';
import 'package:xiflutter/parsers/container_widget_parser.dart';
import 'package:xiflutter/parsers/custom_paint_widget_parser.dart';
import 'package:xiflutter/parsers/drawer_header_widget_parser.dart';
import 'package:xiflutter/parsers/drawer_widget_parser.dart';
import 'package:xiflutter/parsers/dropcaptext_widget_parser.dart';
import 'package:xiflutter/parsers/expanded_widget_parser.dart';
import 'package:xiflutter/parsers/fittedbox_widget_parser.dart';
import 'package:xiflutter/parsers/flat_button_parser.dart';
import 'package:xiflutter/parsers/gridview_widget_parser.dart';
import 'package:xiflutter/parsers/icon_widget_parser.dart';
import 'package:xiflutter/parsers/image_widget_parser.dart';
import 'package:xiflutter/parsers/indexedstack_widget_parser.dart';
import 'package:xiflutter/parsers/listtile_widget_parser.dart';
import 'package:xiflutter/parsers/listview_widget_parser.dart';
import 'package:xiflutter/parsers/opacity_widget_parser.dart';
import 'package:xiflutter/parsers/padding_widget_parser.dart';
import 'package:xiflutter/parsers/pageview_widget_parser.dart';
import 'package:xiflutter/parsers/placeholder_widget_parser.dart';
import 'package:xiflutter/parsers/row_column_widget_parser.dart';
import 'package:xiflutter/parsers/safearea_widget_parser.dart';
import 'package:xiflutter/parsers/scaffold_widget_parser.dart';
import 'package:xiflutter/parsers/selectabletext_widget_parser.dart';
import 'package:xiflutter/parsers/single_child_scroll_widget_parser.dart';
import 'package:xiflutter/parsers/sizedbox_widget_parser.dart';
import 'package:xiflutter/parsers/stack_positioned_widgets_parser.dart';
import 'package:xiflutter/parsers/text_form_field_parser.dart';
import 'package:xiflutter/parsers/text_widget_parser.dart';
import 'package:xiflutter/parsers/wrap_widget_parser.dart';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class DynamicWidgetBuilder {
  static final Logger log = Logger('DynamicWidget');

  static final _parsers = [
    ContainerWidgetParser(),
    TextWidgetParser(),
    SelectableTextWidgetParser(),
    RaisedButtonParser(),
    RowWidgetParser(),
    ColumnWidgetParser(),
    AssetImageWidgetParser(),
    NetworkImageWidgetParser(),
    PlaceholderWidgetParser(),
    GridViewWidgetParser(),
    ListViewWidgetParser(),
    PageViewWidgetParser(),
    ExpandedWidgetParser(),
    PaddingWidgetParser(),
    CenterWidgetParser(),
    AlignWidgetParser(),
    AspectRatioWidgetParser(),
    FittedBoxWidgetParser(),
    BaselineWidgetParser(),
    StackWidgetParser(),
    PositionedWidgetParser(),
    IndexedStackWidgetParser(),
    ExpandedSizedBoxWidgetParser(),
    SizedBoxWidgetParser(),
    OpacityWidgetParser(),
    WrapWidgetParser(),
    DropCapTextParser(),
    IconWidgetParser(),
    ClipRRectWidgetParser(),
    SafeAreaWidgetParser(),
    ListTileWidgetParser(),
    TextFormFieldParser(),
    FlatButtonParser(),
    SingleChildScrollWidgetParser(),
    CardWidgetParser(),
    CustomPaintWidgetParser(),
    ScaffoldWidgetParser(),
    DrawerWidgetParser(),
    DrawerHeaderWidgetParser(),
    AppBarWidgetParser(),
    BottomNavigationBarWidgetParser()
  ];

  static final _widgetNameParserMap = <String, WidgetParser>{};

  static bool _defaultParserInited = false;

  // use this method for adding your custom widget parser
  static void addParser(WidgetParser parser) {
    log.info(
        "add custom widget parser, make sure you don't overwirte the widget type.");
    _parsers.add(parser);
    _widgetNameParserMap[parser.widgetName] = parser;
  }

  static void initDefaultParsersIfNess() {
    if (!_defaultParserInited) {
      for (var parser in _parsers) {
        _widgetNameParserMap[parser.widgetName] = parser;
      }
      _defaultParserInited = true;
    }
  }

  static Widget build(
      String json, BuildContext buildContext, ClickListener listener) {
    initDefaultParsersIfNess();
    var map = jsonDecode(json);
    ClickListener _listener =
        listener == null ? new NonResponseWidgetClickListener() : listener;
    var widget = buildFromMap(map, buildContext, _listener);
    return widget;
  }

  static Widget buildFromMap(Map<String, dynamic> map,
      BuildContext buildContext, ClickListener listener) {
    initDefaultParsersIfNess();
    if (map == null) {
      return null;
    }
    String widgetName = map['type'];
    if (widgetName == null) {
      return null;
    }
    var parser = _widgetNameParserMap[widgetName];
    if (parser != null) {
      return parser.parse(map, buildContext, listener);
    }
    log.warning("Not support parser type: $widgetName");
    return null;
  }

  static List<Widget> buildWidgets(
      List<dynamic> values, BuildContext buildContext, ClickListener listener) {
    initDefaultParsersIfNess();
    List<Widget> rt = [];
    for (var value in values) {
      rt.add(buildFromMap(value, buildContext, listener));
    }
    return rt;
  }

  static Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    initDefaultParsersIfNess();
    var parser = _findMatchedWidgetParserForExport(widget);
    if (parser != null) {
      return parser.export(widget, buildContext);
    }
    log.warning(
        "Can't find WidgetParser for Type ${widget.runtimeType} to export.");
    return null;
  }

  static List<Map<String, dynamic>> exportWidgets(
      List<Widget> widgets, BuildContext buildContext) {
    initDefaultParsersIfNess();
    List<Map<String, dynamic>> rt = [];
    for (var widget in widgets) {
      rt.add(export(widget, buildContext));
    }
    return rt;
  }

  static WidgetParser _findMatchedWidgetParserForExport(Widget widget) {
    for (var parser in _parsers) {
      if (parser.matchWidgetForExport(widget)) {
        return parser;
      }
    }
    return null;
  }
}

/// extends this class to make a Flutter widget parser.
abstract class WidgetParser {
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener);

  /// the widget type name for example:
  /// {"type" : "Text", "data" : "Denny"}
  /// if you want to make a flutter Text widget, you should implement this
  /// method return "Text", for more details, please see
  /// @TextWidgetParser
  String get widgetName;

  /// export the runtime widget to json
  Map<String, dynamic> export(Widget widget, BuildContext buildContext);

  /// match current widget
  Type get widgetType;

  bool matchWidgetForExport(Widget widget) => widget.runtimeType == widgetType;
}

abstract class ClickListener {
  void onClicked(String event, BuildContext context);
}

abstract class SigninListener extends ClickListener {
  void addController(TextEditingController controller, String name);
}

abstract class BottomNavigationBarListener extends ClickListener {
  void setCurrentIndex(int currentIndex);
}

class NonResponseWidgetClickListener implements ClickListener {
  static final Logger log = Logger('NonResponseWidgetClickListener');

  @override
  void onClicked(String event, BuildContext context) {
    log.info("receiver click event: " + event);
    print("receiver click event: " + event);
  }
}
