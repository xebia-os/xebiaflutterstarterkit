import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main/model/ListModels.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

import 'TextFieldWidgets/SimpleTextField.dart';
import 'TextFieldWidgets/RBTextField.dart';

class TextFieldScreen extends StatefulWidget {


  @override
  TextFieldScreenState createState() => TextFieldScreenState();
}

class TextFieldScreenState extends State<TextFieldScreen> {
  List<ListModel> example = [
    ListModel(name: 'Simple TextField', widget: SimpleTextField()),
    ListModel(name: 'Border TextField', widget: RBTextField()),
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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Text Field'),
        body: ListView.builder(
          itemCount: example.length,
          itemBuilder: ((BuildContext context, index) {
            return ExampleItemWidget(example[index], onTap: () {
              example[index].widget.launch(context);
            });
          }),
        ),
      ),
    );
  }
}
