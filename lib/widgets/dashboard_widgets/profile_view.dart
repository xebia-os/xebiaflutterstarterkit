import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';

class ProfileView extends StatefulWidget {
  final String jsonString;

  ProfileView({this.jsonString});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return _buildWithScaffold(context);
  }

  _buildWithScaffold(BuildContext context) {
    return DynamicWidgetBuilder.build(
        widget.jsonString, context, ProfileListener());
  }
}

class ProfileListener implements ClickListener {
  @override
  void onClicked(String event, BuildContext context) {
    // TODO: implement onClicked
  }
}
