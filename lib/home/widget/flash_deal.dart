import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ovo_app/home/widget/countdown_time.dart';
import 'package:ovo_app/utils/helper.dart';

class FlashDealListView extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget itemChild;
  final Color subtitleColor;
  final FontWeight subtitleFontWeight;
  final Color backgroundColor;
  final String backgroundImage;

  FlashDealListView(
      {Key key,
      this.title,
      this.subtitle,
      this.itemChild,
      this.subtitleColor,
      this.subtitleFontWeight,
      this.backgroundColor,
      this.backgroundImage})
      : super(key: key);

  @override
  _FlashDealListViewState createState() {
    return _FlashDealListViewState();
  }
}

class _FlashDealListViewState extends State<FlashDealListView> {
  ScrollController _scrollController;

  var leftBackground = 0.0;
  var opacityBg = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollItem);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onScrollItem() {
//    print((MediaQuery.of(context).size.width/2)-_scrollController.position.pixels/2);
//    leftBackground =1-_scrollController.position.pixels;
//    print(leftBackground);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              if (_scrollController.offset.round() < 163) {
                leftBackground = 0 - _scrollController.position.pixels / 6;
                opacityBg = 1 -
                    _scrollController.offset /
                        (MediaQuery.of(context).size.width / 2);
              }
              print(leftBackground);
            });
          }
          return false;
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  left: leftBackground,
                  child: Opacity(
                    opacity: opacityBg,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child:CachedNetworkImage(
                        imageUrl:widget.backgroundImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, HexColor("#FFe1f5fe")],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.8, 0.0)),
                  ))),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.0),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Text(
                            "Lihat semua",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                      width: 20,
                    ),
                    Visibility(
                        visible: widget.subtitle != "",
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: CountDownTimer(
                              duration: 120,
                              textStyle: TextStyle(
                                  fontSize: 12, color: widget.subtitleColor),
                            ),
                          ),
                        )),
                    _listItemFlashDeal(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _listItemFlashDeal(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.4,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 2, right: 16.0),
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.6,
                        height: (MediaQuery.of(context).size.height / 3.4) / 1.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://aqua.co.id/uploads/2019/09/5d832abbe2bc7_1568877243.png",
                            placeholder: (context, url) =>
                                Icon(Icons.image),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                          child: Container(
                        width: 38,
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(24),
                                topLeft: Radius.circular(14))),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "10%",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text("Aqua",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700))),
                  Text("Rp2000",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.6,
                      child: LinearProgressIndicator(
                        value: 0.2,
                        backgroundColor: Colors.white70,
                      )),
                  Text("Tersisa 4", style: TextStyle(fontSize: 11)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
