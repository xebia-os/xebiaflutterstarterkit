import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class VListView extends StatefulWidget {

  @override
  _VListViewState createState() => _VListViewState();
}

class _VListViewState extends State<VListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Simple List View'),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 16),
            itemBuilder: (context, index) {
              return DataList(dataList[index], index);
            }),
      ),
    );
  }
}

class DataList extends StatelessWidget {
  DataModel model;

  DataList(DataModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: boxDecoration(
          radius: 10, showShadow: true, bgColor: appStore.scaffoldBackground),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [


          Text(
            model.name,
            style: boldTextStyle(color: appStore.textPrimaryColor),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}

class DataModel {
  var name;

  DataModel({
    this.name,
  });
}

List<DataModel> dataList = [
  DataModel(
    name: 'Xamarin',
  ),
  DataModel(
    name: 'Flutter',
  ),
  DataModel(
    name: 'Android',
  ),
  DataModel(
    name: 'iOS',
  ),
  DataModel(
    name: 'React Native',
  ),
  DataModel(
    name: 'Python',
  ),

];
