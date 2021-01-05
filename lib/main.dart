import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/screens/SplashScreen.dart';
import 'package:xiflutter/main/store/AppStore.dart';
import 'package:xiflutter/main/utils/AppTheme.dart';
import 'package:xiflutter/routes.dart';

import 'main/utils/AppConstant.dart';
import 'main/utils/AppWidget.dart';

import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/parsers/constrained_box_widget_parser.dart';

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DynamicWidgetBuilder.addParser(ConstrainedBoxWidgetParser());
  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes(),
        title: '$mainAppName${isWeb ? ' ${platformName()}' : ''}',
        home: SplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        builder: (context, child) =>
            ScrollConfiguration(behavior: SBehavior(), child: child),
      ),
    );
  }
}
