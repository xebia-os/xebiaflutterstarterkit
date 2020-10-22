import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppConstant.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class CustomImageBottomNav extends StatefulWidget {


  @override
  CustomImageBottomNavState createState() => CustomImageBottomNavState();
}

class CustomImageBottomNavState extends State<CustomImageBottomNav> {
  int currentIndex2 = 0;
  final example2 = [
    Text('Home', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Gallery', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Profile', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            example2.elementAt(currentIndex2),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText(LoremText),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex2 = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: appStore.appBarColor,
        unselectedItemColor: appStore.iconSecondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex2,
        items: [
          //1
          BottomNavigationBarItem(
            icon: Image.asset('images/app/home.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/app/home.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Home'),
            backgroundColor: appStore.appBarColor,
          ),
          //2
          BottomNavigationBarItem(
            icon: Image.asset('images/app/gallery.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/app/gallery.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconSecondaryColor, width: 1)),
              child: Image.asset('images/app/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconColor, width: 1)),
              child: Image.asset('images/app/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)),
      Text(text, style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)).expand(),
    ],
  );
}
