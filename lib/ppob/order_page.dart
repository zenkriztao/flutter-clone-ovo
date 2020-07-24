import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ovo_app/models/paketdata_mdl.dart';
import 'package:ovo_app/ppob/widget/toggle_button_list.dart';
import 'package:ovo_app/utils/translate_animation.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key, this.hintText, this.titleBar}) : super(key: key);

  final String hintText;
  final String titleBar;

  @override
  _OrderPageState createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  PaketdataMdl paketdataMdl = new PaketdataMdl();

  final _controllerScroll = ScrollController();
  int _state = 0;

  @override
  void initState() {
    _controllerScroll.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onScroll() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleBar),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: _controllerScroll,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          filled: false,
                          prefixIcon: Icon(Icons.phone),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.credit_card,color: Colors.red,),
                                SizedBox(width: 8,),
                                Icon(Icons.contacts)
                              ],
                            )),
                          ),
                          border: OutlineInputBorder(),
                          hintText: widget.hintText,
                        ),
                        initialValue: "0812324234433",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ToogleButtonList(
                        onSelected: (value) {
                          print(value);
                          setState(() {
                            _controllerScroll.jumpTo(
                                _controllerScroll.position.maxScrollExtent);
                            paketdataMdl = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Visibility(
                visible: paketdataMdl.price != null,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Rincian Informasi",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("No. handphone"),
                            Text(
                              "081232356436",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Pulsa"),
                            Text(
                              "${paketdataMdl.title}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total Tagihan",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${paketdataMdl.price}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Visibility(
                visible: paketdataMdl.price != null,
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
      ),
    );
  }

  Container _checkoutButton(BuildContext context) {
    return Container(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onPressed: () {
                              animateButton();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Bayar"),
                                  Row(
                                    children: <Widget>[
                                      Text("Rp${paketdataMdl.price}"),
                                      SizedBox(
                                        width: 14,
                                      ),
                                     -_state==0? TranslateAnimation(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: Colors.white),
                                            child: Icon(
                                              Icons.navigate_next,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 18,
                                            )),
                                      ): SizedBox(
                                       height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                     ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                          ));
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
