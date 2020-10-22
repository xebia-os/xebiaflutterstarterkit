import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class CardScreen extends StatefulWidget {


  @override
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
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
        appBar: appBar(context, 'Cards'),
        body: ListView(
          children: [
            getCard1(),
            getCard2(),
          ],
        ),
      ),
    );
  }

  Widget getCard1() {
    return Card(
      margin: EdgeInsets.all(16),
      color: appStore.appBarColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: Image.network('https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createWord(numWords: 2), style: boldTextStyle(size: 20, color: appStore.textPrimaryColor)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createParagraph(numSentences: 1), style: secondaryTextStyle(size: 16, color: appStore.textSecondaryColor)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard2() {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: appStore.appBarColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: Image.network('https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.bookmark, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.favorite, color: appStore.iconColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.share, color: appStore.iconColor, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
