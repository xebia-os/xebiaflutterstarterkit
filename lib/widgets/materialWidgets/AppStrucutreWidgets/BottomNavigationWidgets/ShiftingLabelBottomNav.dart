import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class ShiftingLabelBottomNav extends StatefulWidget {


  @override
  BottomNavigationScreenState createState() =>
      BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<ShiftingLabelBottomNav> {
  int currentIndex3 = 0;

  final example3 = [
    Text('Home',
        style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Gallery',
        style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Profile',
        style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
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
            example3.elementAt(currentIndex3),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText(
                    'Lorem Epsum'),
                5.height,
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomTheme(
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex3 = index;
            });
          },
          currentIndex: currentIndex3,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: appStore.iconColor,
          unselectedItemColor: appStore.textSecondaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            //1
            BottomNavigationBarItem(
              icon: Image.asset(
                  'images/app/home.png',
                  height: 25,
                  width: 25,
                  color: appStore.iconSecondaryColor),
              activeIcon: Image.asset(
                  'images/app/home.png',
                  height: 25,
                  width: 25,
                  color: appStore.iconColor),
              title: Text('Home'),
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                  'images/app/gallery.png',
                  height: 25,
                  width: 25,
                  color: appStore.iconSecondaryColor),
              activeIcon: Image.asset(
                  'images/app/gallery.png',
                  height: 25,
                  width: 25,
                  color: appStore.iconColor),
              title: Text('Gallery'),
            ),

            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: appStore.iconSecondaryColor, width: 1)),
                child: Image.asset(
                        'images/app/profile1.png',
                        height: 30,
                        width: 30)
                    .cornerRadiusWithClipRRect(20),
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: appStore.iconColor, width: 1)),
                child: Image.asset(
                        'images/app/profile1.png',
                        height: 30,
                        width: 30)
                    .cornerRadiusWithClipRRect(20),
              ),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ",
          style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)),
      Text(text,
              style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14))
          .expand(),
    ],
  );
}
