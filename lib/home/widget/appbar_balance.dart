import 'package:flutter/material.dart';
import 'package:ovo_app/topup/topup_saldo_page.dart';

class AppbarBalance extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  AppbarBalance({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 0.7)),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 75 - shrinkOffset))),
          child: Opacity(
            opacity: (1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Available Balance",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Rp",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "1.000.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.7 - shrinkOffset,
          left: 14,
          right: 14,
          child: Opacity(
            opacity: (1),
            child: Card(
              elevation: 4.0,
              child: Container(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TopupSaldoPage()));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Top Up",
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.call_missed_outgoing,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Transfer",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.card_membership,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Voucher",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
