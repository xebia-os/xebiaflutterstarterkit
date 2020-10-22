import 'package:flutter/material.dart';
import 'package:xiflutter/main/model/AppModel.dart';
import 'package:xiflutter/main/screens/ScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ScreenListing.tag: (context) => ScreenListing(XITheme()),
  };
}
