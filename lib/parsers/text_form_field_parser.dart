import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';

class TextFormFieldParser implements WidgetParser {
  _setTextCaptalization(String textCaptalization) {
    if (textCaptalization == "") {
      return TextCapitalization.none;
    }
    switch (textCaptalization) {
      case 'characters':
        return TextCapitalization.characters;
      case 'sentences':
        return TextCapitalization.sentences;
      case 'words':
        return TextCapitalization.words;
      case 'none':
        return TextCapitalization.none;
    }
  }

  _setKeyboardType(String keyboard) {
    switch (keyboard.toLowerCase()) {
      case 'email':
        return TextInputType.emailAddress;
      case 'number':
        return TextInputType.number;
      case 'phone':
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  _setIcon(String iconName) {
    if (iconName == "") {
      return null;
    }
    Icon iconWidget;
    switch (iconName) {
      case "email":
        iconWidget = Icon(Icons.email);
        break;
      case "password":
        iconWidget = Icon(Icons.lock);
        break;
      case "username":
        iconWidget = Icon(Icons.account_circle_outlined);
    }
    return iconWidget;
  }

  _getController(
      String initialValue, String controllerName, SigninListener listener) {
    final controller = TextEditingController();
    if (initialValue.length > 0) {
      controller.text = initialValue;
    }
    listener.addController(controller, controllerName);
    return controller;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String initialValue = map['initialValue'] ?? "";
    int maxLines = map['maxLines'] ?? 1;
    bool obscureText =
        map['obscureText'].toString().toLowerCase() == 'true' ? true : false;
    String placeholder = map['placeholder'] ?? "";
    String helperText = map['helperText'] ?? "";
    String labelText = map['labelText'] ?? "";
    Map<String, dynamic> labelTextStyle = map['labelTextStyle'] ?? null;
    String textCaptalization = map['textCaptalization'] ?? "";
    String prefixIcon = map["prefixIcon"];
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    String name = map["name"] ?? "";
    String keyboardType = map["keyboardType"] ?? "";
    Map<String, dynamic> enabledBorder = map["enabledBorder"] ?? null;
    Map<String, dynamic> focusBorder = map["focusBorder"] ?? null;
    Map<String, dynamic> border = map['border'] ?? null;
    String backgroundColor = map['fillColor'] ?? "";
    Color textColor = parseHexColor(map["textColor"]);
    Color hintTextColor = parseHexColor(map["hintTextColor"]);
    Map<String, dynamic> suffixConstraints =
        map.containsKey('suffixConstraints') ? map['suffixConstraints'] : null;
    Map<String, dynamic> suffixWidget = map['suffixIcon'];
    Widget suffixIconWidget = suffixWidget == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(
            suffixWidget, buildContext, listener);

    if (padding != null) {
      return Padding(
        padding: padding,
        child: TextFormField(
          controller: _getController(initialValue, name, listener),
          maxLines: maxLines,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            filled: backgroundColor.length > 0 ? true : false,
            fillColor: backgroundColor.length > 0
                ? parseHexColor(backgroundColor)
                : null,
            enabledBorder: enabledBorder != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: parseHexColor(enabledBorder['color']),
                      width: enabledBorder['width'],
                    ),
                    borderRadius: BorderRadius.circular(
                        enabledBorder['borderRadius'] ?? 0.0),
                  )
                : null,
            focusedBorder: focusBorder != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: parseHexColor(focusBorder['color']),
                      width: focusBorder['width'],
                    ),
                    borderRadius: BorderRadius.circular(
                        focusBorder['borderRadius'] ?? 0.0),
                  )
                : null,
            border: border != null
                ? OutlineInputBorder(
                    borderRadius: parseBorderRadius(border['borderRadius']),
                  )
                : null,
            hintText: placeholder,
            hintStyle: TextStyle(color: hintTextColor),
            helperText: helperText ?? "",
            labelText: labelText,
            labelStyle: labelTextStyle == null
                ? null
                : TextStyle(color: labelTextStyle['color']),
            prefix: _setIcon(prefixIcon),
            suffixIcon: suffixIconWidget,
            suffixIconConstraints: suffixConstraints != null
                ? BoxConstraints(
                    minWidth: suffixConstraints['minWidth'],
                    minHeight: suffixConstraints['minHeight'])
                : null,
          ),
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscureText,
          textCapitalization: _setTextCaptalization(textCaptalization),
          keyboardType: _setKeyboardType(keyboardType),
        ),
      );
    } else {
      return TextFormField(
        controller: _getController(initialValue, name, listener),
        maxLines: maxLines,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          filled: backgroundColor.length > 0 ? true : false,
          fillColor: backgroundColor.length > 0
              ? parseHexColor(backgroundColor)
              : null,
          enabledBorder: enabledBorder != null
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: parseHexColor(enabledBorder['color']),
                    width: enabledBorder['width'],
                  ),
                  borderRadius: BorderRadius.circular(
                      enabledBorder['borderRadius'] ?? 0.0),
                )
              : null,
          focusedBorder: focusBorder != null
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: parseHexColor(focusBorder['color']),
                    width: focusBorder['width'],
                  ),
                  borderRadius:
                      BorderRadius.circular(focusBorder['borderRadius'] ?? 0.0),
                )
              : null,
          border: border != null
              ? OutlineInputBorder(
                  borderRadius: parseBorderRadius(border['borderRadius']),
                )
              : null,
          hintText: placeholder,
          helperText: helperText ?? "",
          hintStyle: TextStyle(color: hintTextColor),
          labelText: labelText,
          labelStyle: labelTextStyle == null
              ? null
              : TextStyle(
                  color: setThemeColor(buildContext, labelTextStyle['color'])),
          prefix: _setIcon(prefixIcon),
          suffixIcon: suffixIconWidget,
          suffixIconConstraints: suffixConstraints != null
              ? BoxConstraints(
                  minWidth: suffixConstraints['minWidth'],
                  minHeight: suffixConstraints['minHeight'])
              : null,
        ),
        obscureText: obscureText,
        textCapitalization: _setTextCaptalization(textCaptalization),
        textAlignVertical: TextAlignVertical.center,
        keyboardType: _setKeyboardType(keyboardType),
      );
    }
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'TextFormField';

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    // TODO: implement export
    var realWidget = widget as TextFormField;
    return <String, dynamic>{
      "type": "TextFormField",
      "initialValue": realWidget.initialValue,
      "maxLines": 1,
      "hintText": "",
      "obscureText": "false",
    };
  }

  @override
  // TODO: implement widgetType
  Type get widgetType => TextFormField;

  @override
  bool matchWidgetForExport(Widget widget) => widget is TextFormField;
}
