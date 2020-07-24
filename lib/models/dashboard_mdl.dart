import 'package:flutter/cupertino.dart';

class DashboardMdl {
  int id;
  String title;
  String hintText;
  String icon;

  static DashboardMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DashboardMdl dashboardMdlBean = DashboardMdl();
    dashboardMdlBean.id = map['id'];
    dashboardMdlBean.title = map['title'];
    dashboardMdlBean.icon = map['icon'];
    return dashboardMdlBean;
  }


  static DashboardMdl fromValue({int id, String title,String icon,String hintText}) {
    DashboardMdl dashboardMdlBean = DashboardMdl();
    dashboardMdlBean.id = id;
    dashboardMdlBean.title = title;
    dashboardMdlBean.icon = icon;
    dashboardMdlBean.hintText = hintText;
    return dashboardMdlBean;
  }
  Map toJson() => {
    "id": id,
    "title": title,
    "icon": icon,
  };
}