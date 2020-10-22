import 'package:flutter/material.dart';

class AppTheme {
  List<XITheme> themes;
  XITheme widgets;

  AppTheme({this.themes,  this.widgets,});

  factory AppTheme.fromJson(Map<String, dynamic> json) {
    return AppTheme(
      themes: json['themes'] != null ? (json['themes'] as List).map((i) => XITheme.fromJson(i)).toList() : null,
      widgets: json['widgets'] != null ? XITheme.fromJson(json['widgets']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.themes != null) {
      data['themes'] = this.themes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class XITheme {
  String name;
  bool show_cover;
  List<XITheme> sub_kits;
  String title_name;
  String type;
  String icon;
  bool is_theme;
  String tag;
  bool darkThemeSupported;
  Widget widget;

  XITheme({this.name, this.icon, this.is_theme, this.tag, this.type, this.show_cover, this.sub_kits, this.title_name, this.darkThemeSupported, this.widget});

  factory XITheme.fromJson(Map<String, dynamic> json) {
    return XITheme(
      name: json['name'],
      icon: json['icon'],
      is_theme: json['is_theme'],
      tag: json['tag'],
      type: json['type'],
      show_cover: json['show_cover'],
      sub_kits: json['sub_kits'] != null ? (json['sub_kits'] as List).map((i) => XITheme.fromJson(i)).toList() : null,
      title_name: json['title_name'],
      darkThemeSupported: json['darkThemeSupported'],
      widget: json['widget'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['show_cover'] = this.show_cover;
    data['title_name'] = this.title_name;
    data['type'] = this.type;
    data['tag'] = this.tag;
    data['darkThemeSupported'] = this.darkThemeSupported;
    data['icon'] = this.icon;
    data['widget'] = this.widget;
    data['is_theme'] = this.is_theme;
    if (this.sub_kits != null) {
      data['sub_kits'] = this.sub_kits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
