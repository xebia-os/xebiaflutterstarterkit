import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class HorizontalListView extends StatefulWidget {


  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<ItemModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Horizontal List View'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text("Places", style: boldTextStyle(color: appStore.textPrimaryColor, size: 18)).paddingLeft(16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mListing.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return Product(mListing[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  ItemModel model;

  Product(ItemModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.network(
              model.img,
              fit: BoxFit.cover,
              height: 170,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: primaryTextStyle(color: appStore.textPrimaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  var name = "";
  var img = "";
}

List<ItemModel> getData() {
  List<ItemModel> popularArrayList = List<ItemModel>();
  ItemModel item1 = ItemModel();
  item1.img = 'https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500';
  item1.name = "Austria";

  ItemModel item2 = ItemModel();
  item2.img = 'https://pbs.twimg.com/profile_banners/356692321/1589790692/1500x500';
  item2.name = "Austria";


  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item1);
  popularArrayList.add(item2);

  return popularArrayList;
}
