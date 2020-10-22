import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/screens/Launcher.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppConstant.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  void navigationPage() async {


    await Future.delayed(Duration(seconds: 3));

      Launcher().launch(context, isNewTask: true);

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorPrimary,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/app/app_icon.png', height: 200, fit: BoxFit.fitHeight),
      ),
    );
  }
}
