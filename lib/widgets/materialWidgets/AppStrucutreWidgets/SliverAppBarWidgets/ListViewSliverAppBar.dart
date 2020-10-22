import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class ListViewSliverAppBar extends StatefulWidget {


  @override
  _ListViewSliverAppBarState createState() => _ListViewSliverAppBarState();
}

class _ListViewSliverAppBarState extends State<ListViewSliverAppBar> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.filter_1),
                color: appStore.isDarkModeOn
                    ? appStore.iconColor
                    : innerBoxIsScrolled
                        ? blackColor
                        : white,
                onPressed: () {
                  // Do something
                },
              ),
              expandedHeight: 220.0,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 50,
              backgroundColor: appStore.appBarColor,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('SAB with ListView', style: primaryTextStyle(color: innerBoxIsScrolled ? appStore.textPrimaryColor : white)),
                  background: CachedNetworkImage(
                    placeholder: placeholderWidgetFn(),
                    imageUrl: 'https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item ${index.toString()}',
                    style: TextStyle(fontSize: 20.0, color: appStore.textPrimaryColor),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
