import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class BottomNavigationBarWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Key key = map['key'] ?? null;
    List<dynamic> itemMap = map['items'];
    int currentIndex = map['currentIndex'] ?? 0;
    double elevation = map['elevation'] ?? 5.0;

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    getIcon(String icon) {
      if (icon.characters.contains("/")) {
        return Image.asset(icon);
      } else {
        switch (icon) {
          case 'home':
            return Icon(Icons.home);
          case 'mail':
            return Icon(Icons.mail);
          case 'person':
            return Icon(Icons.person);
        }
      }
    }

    setBottomNavigationType(String type) {
      return type == 'fixed'
          ? BottomNavigationBarType.fixed
          : BottomNavigationBarType.shifting;
    }

    setAndNotifyCurrentIndex(int index, BottomNavigationBarListener listener) {
      listener.setCurrentIndex(index);
      return index;
    }

    var bottomNavigationBarWidget = BottomNavigationBar(
      key: key,
      items: itemMap.map((item) {
        BottomNavigationBarItem(
          icon: getIcon(item['icon']),
          label: item['label'],
          activeIcon:
              map.containsKey('activeIcon') ? getIcon(map['activeIcon']) : null,
          backgroundColor: setThemeColor(buildContext, map['backgroundColor']),
        );
      }).toList(),
      currentIndex: setAndNotifyCurrentIndex(currentIndex, listener),
      elevation: elevation,
      type:
          map.containsKey('type') ? setBottomNavigationType(map['type']) : null,
      //fixedColor: setThemeColor(buildContext, map['fixedColor']),
      backgroundColor: setThemeColor(buildContext, map['backgroundColor']),
      iconSize: map.containsKey('iconSize') ? map['iconSize'] : 24.0,
      selectedItemColor: setThemeColor(buildContext, map['selectedItemColor']),
      unselectedItemColor:
          setThemeColor(buildContext, map['unselectedItemColor']),
      selectedFontSize:
          map.containsKey('selectedFontSize') ? map['selectedFontSize'] : 14.0,
      unselectedFontSize: map.containsKey('unselectedFontSize')
          ? map['unselectedFontSize']
          : 12.0,
      selectedLabelStyle: map.containsKey('selectedLabelStyle')
          ? parseTextStyle(map['selectedLabelStyle'])
          : null,
      unselectedLabelStyle: map.containsKey('unselectedLabelStyle')
          ? parseTextStyle(map['unselectedLabelStyle'])
          : null,
      showSelectedLabels: map['showSelectedLabels'] ?? false,
      onTap: (index) {
        String eventString = clickEvent + "$index";
        listener.onClicked(eventString, buildContext);
      },
    );

    // if (listener != null && clickEvent != null) {
    //   return GestureDetector(
    //     onTap: () {
    //       listener.onClicked(clickEvent, buildContext);
    //     },
    //     child: drawerHeaderWidget,
    //   );
    // } else {
    return bottomNavigationBarWidget;
    //}
  }

  @override
  String get widgetName => "BottomNavigationBar";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as BottomNavigationBar;
    return <String, dynamic>{
      "type": widgetName,
      "items": realWidget.items,
    };
  }

  @override
  Type get widgetType => BottomNavigationBar;
}
