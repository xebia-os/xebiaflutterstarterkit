import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class SimpleDrawerScreen extends StatefulWidget {


  @override
  _SimpleDrawerScreenState createState() => _SimpleDrawerScreenState();
}

class _SimpleDrawerScreenState extends State<SimpleDrawerScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    scaffoldKey.currentState.openDrawer();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Simple', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 22)),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CachedNetworkImage(
                  placeholder: placeholderWidgetFn(),
                  imageUrl: 'https://cdn.iconscout.com/icon/free/png-256/avatar-380-456332.png',
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(100),
                accountName: Text('GV'),

                accountEmail: Text('gv@gmail.com'),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.home, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState.openEndDrawer();
                  toast('Home');
                },
              ),
              ListTile(
                title: Text(
                  "Photos",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.photo, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState.openEndDrawer();
                  toast('Photos');
                },
              ),
              ListTile(
                title: Text(
                  "Movies",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.movie, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState.openEndDrawer();
                  toast('Movies');
                },
              ),
              ListTile(
                title: Text(
                  "Notification",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.notifications, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState.openEndDrawer();
                  toast('Notification');
                },
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: boldTextStyle(color: black),
                ),
                leading: Icon(Icons.settings, color: Colors.black.withOpacity(0.7)),
                onTap: () {
                  scaffoldKey.currentState.openEndDrawer();
                  toast('Settings');
                },
              ),
              Divider(),
              Text('Other').paddingLeft(12.0),
              Text(
                'About Us',
                style: boldTextStyle(color: black),
              ).paddingAll(12.0).onTap(() {
                scaffoldKey.currentState.openEndDrawer();
                toast('About us');
              }),
            ],
          ),
        ),

      ),
    );
  }
}
