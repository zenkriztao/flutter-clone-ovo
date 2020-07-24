import 'package:flutter/material.dart';
import 'package:ovo_app/utils/helper.dart';
import 'package:ovo_app/utils/icon_assets.dart';

class PaymentConfirmPage extends StatelessWidget {
  PaymentConfirmPage({Key key}) : super(key: key);
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Payment"),
        centerTitle: false,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "PAYABLE AMOUNT",
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Rp40.000",
                            style: TextStyle(
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.7),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.9,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "RECEIVER DETAIL",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  color: HexColor("#e1f5fe"),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    IconAssets.iconShop,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Atlas Payments",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.language),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "All you transactions are secure and fast. By continuing, you agree to the",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.payment,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "StickPay",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(Icons.more_vert)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: _checkoutButton(context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _checkoutButton(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Bayar"),
                Row(
                  children: <Widget>[
                    Text("Rp 50"),
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white),
                        child: Icon(
                          Icons.navigate_next,
                          color: Theme.of(context).primaryColor,
                          size: 18,
                        )),
                  ],
                ),
              ],
            ),
          ),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ));
  }
}
