import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';

class DashboardView extends StatefulWidget {
  final String jsonString;

  DashboardView({this.jsonString});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return _buildWithScaffold(context);
  }

  _buildWithScaffold(BuildContext context) {
    return DynamicWidgetBuilder.build(
        widget.jsonString, context, ScaffoldListener());
  }
}

class ScaffoldListener implements BottomNavigationBarListener {
  int currentIndex = 0;
  @override
  void onClicked(String event, BuildContext context) {
    print("Receive click event: " + event);
    print("context" + context.toString());
    if (event == "resetPassword") {
      print("*************************************");
    } else if (event == 'Item1') {
      print("****************** Item 1 *******************");
    } else if (event == 'Item2') {
      print("****************** Item 2 *******************");
    } else if (event == 'Item3') {
      print("****************** Item 3 *******************");
    } else if (event == 'Item4') {
      print("****************** Item 4 *******************");
    }
  }

  @override
  void setCurrentIndex(int currentIndex) {
    // TODO: implement setCurrentIndex
    this.currentIndex = currentIndex;
  }
}
