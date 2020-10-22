import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/SliverAppBarWidgets/ListViewSliverAppBar.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/SliverAppBarWidgets/ParallaxSliverAppBar.dart';

class SliverAppBarScreen extends StatefulWidget {


  @override
  SliverAppBarScreenState createState() => SliverAppBarScreenState();
}

class SliverAppBarScreenState extends State<SliverAppBarScreen> {
  List<ListModel> example = [
    ListModel(
      name: 'ListView SilverAppBar',
      widget: ListViewSliverAppBar(),
    ),
    ListModel(
      name: 'Parallax SliverAppBar',
      widget: ParallaxSliverAppBar(),
    ),
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
        appBar: appBar(context, 'SliverApp Bar Example'),
        body: ListView.builder(
            itemCount: example.length == null ? 0 : example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(
                example[index],
                onTap: () {
                  example[index].widget.launch(context);
                },
              );
            }));
  }
}
