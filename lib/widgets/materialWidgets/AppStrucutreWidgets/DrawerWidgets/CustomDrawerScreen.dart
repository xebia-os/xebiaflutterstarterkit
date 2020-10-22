import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppColors.dart';

class CustomDrawerScreen extends StatefulWidget {


  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appStore.appBarColor,
        title: Text('With  Shape', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 22)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: BoxDecoration(
              color: appStore.appBarColor,
            ),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.orange),
                        image: DecorationImage(image: CachedNetworkImageProvider('https://cdn.iconscout.com/icon/free/png-256/avatar-380-456332.png')),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "GV",
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Text("gv@gmail.com", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 16.0)),
                    30.height,
                    itemList(Icon(Icons.home, color: appStore.iconColor), "Home"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.person_pin, color: appStore.iconColor), "My profile"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.message, color: appStore.iconColor), "Messages"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.notifications, color: appStore.iconColor), "Notifications"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.settings, color: appStore.iconColor), "Settings"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.email, color: appStore.iconColor), "Contact us"),
                    Divider(),
                    15.height,
                    itemList(Icon(Icons.info_outline, color: appStore.iconColor), "Help"),
                    Divider(),
                    15.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }

  Widget itemList(Widget icon, String title) {
    return Row(
      children: [
        icon,
        10.width,
        Text(title, style: TextStyle(color: appStore.textPrimaryColor)),
      ],
    ).onTap(() {
      scaffoldKey.currentState.openEndDrawer();
      toast(title);
    });
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4), size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
