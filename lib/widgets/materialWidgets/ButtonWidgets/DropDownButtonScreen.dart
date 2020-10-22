import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xiflutter/main.dart';
import 'package:xiflutter/main/utils/AppWidget.dart';

class DropDownButtonScreen extends StatefulWidget {


  @override
  _DropDownButtonScreenState createState() => _DropDownButtonScreenState();
}

class _DropDownButtonScreenState extends State<DropDownButtonScreen> {
  List<String> listOfCategory = ['Flutter', 'Android', 'iOS', 'Phonegap'];
  String selectedIndexCategory = 'Flutter';
  String dropdownNames;
  String dropdownScrollable = 'Flutter';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "DropDown Button"),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('Category', style: boldTextStyle()),
              10.height,
              Card(
                  elevation: 4,
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: appStore.appBarColor,
                    value: selectedIndexCategory,
                    style: boldTextStyle(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appStore.iconColor,
                    ),
                    underline: 0.height,
                    onChanged: (newValue) {
                      setState(() {
                        toast(newValue);
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Text(category, style: primaryTextStyle()).paddingLeft(8),
                        value: category,
                      );
                    }).toList(),
                  )),
              10.height,
              Text('Dropdown with  Hint', style: boldTextStyle()),
              10.height,
              DropdownButton<String>(
                value: dropdownNames,
                underline: 0.height,
                dropdownColor: appStore.appBarColor,
                hint: Text(
                  'Choose Text Style',
                  style: primaryTextStyle(size: 16),
                ).paddingLeft(8),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: appStore.iconColor,
                ).paddingLeft(10),
                onChanged: (String newValue) {
                  setState(() {
                    toast(newValue);
                    dropdownNames = newValue;
                  });
                },
                items: <String>['Normal', 'Bold', 'Italic', 'Underline'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Tooltip(message: value, child: Container(margin: EdgeInsets.only(left: 4, right: 4), child: Text(value, style: primaryTextStyle()))),
                  );
                }).toList(),
              ),
              10.height,
              Text('Scrollable Dropdown', style: boldTextStyle()),
              10.height,
              DropdownButton<String>(
                value: dropdownScrollable,
                underline: 0.height,
                dropdownColor: appStore.appBarColor,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: appStore.iconColor,
                ).paddingLeft(10),
                onChanged: (String newValue) {
                  toast(newValue);
                  setState(() {
                    dropdownScrollable = newValue;
                  });
                },
                items: <String>[
                  'Flutter', 'Android', 'iOS', 'Phonegap'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: primaryTextStyle()).paddingLeft(8),
                  );
                }).toList(),
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}
