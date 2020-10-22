import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppColors.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class CheckboxScreen extends StatefulWidget {


  @override
  CheckboxScreenState createState() => CheckboxScreenState();
}

class CheckboxScreenState extends State<CheckboxScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = true;
  bool isChecked5 = true;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;

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
        appBar: appBar(context, "Checkbox"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      activeColor: Colors.grey,
                      value: isChecked1,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked1 = value;
                        });
                      },
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: null,
                      onChanged: (checked) {},
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: true, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked3, // unchecked
                      onChanged: (checked) {
                        setState(() {
                          isChecked3 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked4, // selected
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked4 = checked;
                        });
                      },
                      activeColor: Colors.redAccent, // checkbox color
                      tristate: false, // whether there are three states
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Checkbox(
                      value: isChecked5, // control status value
                      onChanged: (checked) {
                        setState(() {
                          this.isChecked5 = checked;
                        });
                      },
                      tristate: true,
                      activeColor: appColorPrimary,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text('Custom Shape Checkbox', style: boldTextStyle(size: 18)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      color: isChecked6 == true ? appColorPrimary : Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor,
                      ),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked6,
                        onChanged: (state) {
                          setState(() {
                            return isChecked6 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor,
                      ),
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked7,
                        onChanged: (state) {
                          setState(() {
                            return isChecked7 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appColorPrimary,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: appStore.textPrimaryColor,
                      ),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.transparent,
                      ),
                      child: Checkbox(
                        value: isChecked8,
                        onChanged: (state) {
                          setState(() {
                            return isChecked8 = state;
                          });
                        },
                        activeColor: Colors.transparent,
                        checkColor: appColorPrimary,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
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
