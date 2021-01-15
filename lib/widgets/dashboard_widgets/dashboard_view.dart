import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/models/constants.dart';
import 'package:xiflutter/widgets/dashboard_widgets/profile_view.dart';

class DashboardView extends StatefulWidget {
  final String jsonString;

  DashboardView({this.jsonString});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  updateView(BuildContext buildContext) {
    setState(() {
      Navigator.pop(buildContext);
      print("Dashboard Screen updated.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildWithScaffold(context);
  }

  _buildWithScaffold(BuildContext context) {
    return DynamicWidgetBuilder.build(
        widget.jsonString, context, ScaffoldListener(updateView));
  }
}

class ScaffoldListener implements BottomNavigationBarListener {
  Function updateView;
  int currentIndex = 0;

  ScaffoldListener(this.updateView);

  @override
  void onClicked(String event, BuildContext context) {
    print("Receive click event: " + event);
    print("context" + context.toString());
    if (event == "resetPassword") {
      print("*************************************");
    } else if (event == 'home') {
      print("Home tapped.");
      this.updateView(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProfileView(jsonString: Constants.profileJson)));
    } else if (event == 'profile') {
      print("Profile tapped.");
    } else if (event == 'settings') {
      print("Settings tapped.");
    }
  }

  @override
  void setCurrentIndex(int currentIndex) {
    // TODO: implement setCurrentIndex
    this.currentIndex = currentIndex;
  }
}
