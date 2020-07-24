import 'package:flutter/material.dart';
import 'package:ovo_app/models/dashboard_mdl.dart';
import 'package:ovo_app/ppob/order_page.dart';
import 'package:ovo_app/utils/helper.dart';
import 'package:ovo_app/utils/icon_assets.dart';

class DasboardGrid extends StatelessWidget {
  DasboardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _dashboarMenuView(context);
  }
}

List<DashboardMdl> _initDataDasboard() {
  List<DashboardMdl> mListDasboard = List();
  mListDasboard.add(
      DashboardMdl.fromValue(id: 1, title: "PLN", icon: IconAssets.iconPln,hintText: "No. Meter"));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "Pulsa", icon: IconAssets.iconPulsa,hintText: "Phone Number"));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "Paket Data", icon: IconAssets.iconInet,hintText: "Phone Number"));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "Pasca Bayar", icon: IconAssets.iconPascabayar,hintText: "Phone Number"));
  mListDasboard.add(
      DashboardMdl.fromValue(id: 1, title: "BPJS", icon: IconAssets.iconBpjs));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "TV Kabel", icon: IconAssets.iconTvkable));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "Streaming", icon: IconAssets.iconStreaming));
  mListDasboard.add(DashboardMdl.fromValue(
      id: 1, title: "Lainnya", icon: IconAssets.iconMore));
  return mListDasboard;
}

_dashboarMenuView(BuildContext context) {
  _initDataDasboard();
  return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.8, mainAxisSpacing: 0),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage(titleBar: _initDataDasboard()[index].title,hintText: _initDataDasboard()[index].hintText,)));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: HexColor("#e0f7fa")),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        _initDataDasboard()[index].icon,
                        width: 24,
                        height: 24,
                      ),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 70,
                child: Center(
                  child: Text(
                    _initDataDasboard()[index].title,
                    style: TextStyle(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: _initDataDasboard().length));
}
