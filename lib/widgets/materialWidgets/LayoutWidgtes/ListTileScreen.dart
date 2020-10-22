import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class ListTileScreen extends StatefulWidget {


  @override
  ListTileScreenState createState() => ListTileScreenState();
}

class ListTileScreenState extends State<ListTileScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'ListTile'),
        body: ListView.builder(
          itemCount: userList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.all(8),
              elevation: 2,
              child: ListTile(
                onTap: () {
                  toast(userList[index].name);
                },
                leading: CircleAvatar(radius: 20, backgroundImage: Image.asset(userList[index].images).image),
                title: Text(
                  userList[index].name,
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(userList[index].value, style: secondaryTextStyle()),
                ),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserModel {
  String images;
  String name;
  String value;

  UserModel({
    this.images,
    this.name,
    this.value,
  });
}

List<UserModel> userList = [
  UserModel(
    images: 'images/app/profile1.png',
    name: 'GV',
    value: 'Principal Consultant',
  ),
  UserModel(
    images: 'images/app/profile1.png',
    name: 'Ian Whitening',
    value: 'UX Designer',
  ),
  UserModel(
    images: 'images/app/profile1.png',
    name: 'Shekhar',
    value: 'CTO',
  ),

];
