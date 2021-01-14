import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class ScaffoldWidgetParser extends WidgetParser {
  Future<Widget> _buildWidget(BuildContext context,
      Map<String, dynamic> mapJson, ClickListener listener) async {
    return DynamicWidgetBuilder.buildFromMap(mapJson, context, listener);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = Key(map['key']) ?? null;
    Color backgroundColor = parseHexColor(map['color']);
    Map<String, dynamic> drawerJson = map['drawer'];
    Widget drawer = drawerJson == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(drawerJson, buildContext, listener);

    Map<String, dynamic> appBarMap = map['appBar'];
    Widget appBar = appBarMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(appBarMap, buildContext, listener);

    // Map<String, dynamic> bottomTabMap = map['bottomNavigationBar'];
    // Widget bottomNavigationBar = bottomTabMap == null
    //     ? null
    //     : DynamicWidgetBuilder.buildFromMap(
    //         bottomTabMap, buildContext, listener);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var scaffoldWidget = Scaffold(
      key: key,
      body: FutureBuilder<Widget>(
        future: _buildWidget(buildContext, map['body'], listener),
        builder: (BuildContext ctx, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? SizedBox.expand(
                  child: snapshot.data,
                )
              : Text("Loading...");
        },
      ),
      appBar: appBar,
      drawer: drawer,
      //bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent, buildContext);
        },
        child: scaffoldWidget,
      );
    } else {
      return scaffoldWidget;
    }
  }

  @override
  String get widgetName => "Scaffold";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Scaffold;
    return <String, dynamic>{
      "type": widgetName,
      "body": DynamicWidgetBuilder.export(realWidget.body, buildContext)
    };
  }

  @override
  Type get widgetType => Scaffold;
}
