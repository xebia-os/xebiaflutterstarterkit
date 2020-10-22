import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class RadioScreen extends StatefulWidget {


  @override
  RadioScreenState createState() => RadioScreenState();
}

class RadioScreenState extends State<RadioScreen> {
  var gender;
  var gender1;

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
        appBar: appBar(context, "Radio Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Radio Button', style: boldTextStyle(size: 18)),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Male', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Female', style: primaryTextStyle()),
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Transgender',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                          toast("$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Transgender', style: primaryTextStyle()),
                ],
              ),
              8.height,

            ],
          ),
        ),
      ),
    );
  }
}
