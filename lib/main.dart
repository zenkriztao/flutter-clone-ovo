import 'package:flutter/material.dart';
import 'package:ovo_app/main_page.dart';
import 'package:ovo_app/utils/helper.dart';
import 'package:ovo_app/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This home.widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: HexColor("#01579b"),
        primaryColorDark: HexColor("#002f6c"),
        primaryColorLight: HexColor("#4f83cc"),
        accentColor:HexColor("#002f6c") ,
        fontFamily: "Campton_Light"
      ),
      home: MainPage(),
    );
  }
}


