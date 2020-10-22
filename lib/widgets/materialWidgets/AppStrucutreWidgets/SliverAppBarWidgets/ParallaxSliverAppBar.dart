import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class ParallaxSliverAppBar extends StatefulWidget {


  @override
  _ParallaxSliverAppBarState createState() => _ParallaxSliverAppBarState();
}

class _ParallaxSliverAppBarState extends State<ParallaxSliverAppBar> {
  var text = lipsum.createText(numParagraphs: 2, numSentences: 2);

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
        headerSliverBuilder: ((BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: "https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500",
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.parallax,
                title: Text(
                  'Parallax SAB',
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).visible(innerBoxIsScrolled),
              ),
              backgroundColor: appStore.appBarColor,
              leading: BackButton(
                color: innerBoxIsScrolled ? appStore.iconColor : appStore.iconSecondaryColor,
                onPressed: () async {
                  finish(context);
                },
              ),
            ),
          ];
        }),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(text, textAlign: TextAlign.justify, style: primaryTextStyle()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
