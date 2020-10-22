import 'package:flutter/material.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';
import '../../../main.dart';
import 'ListViewWidget/VListView.dart';
import 'ListViewWidget/HorizontalListView.dart';

class ListViewScreen extends StatefulWidget {


  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<ListModel> example = [
    ListModel(name: 'Vertical ListView', widget: ListView()),
    ListModel(name: 'Horizontal ListView', widget: HorizontalListView()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'ListView'),
        body: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => example[index].widget));
              });
            }));
  }
}
