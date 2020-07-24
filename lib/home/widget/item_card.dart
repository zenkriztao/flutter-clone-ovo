import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCardView extends StatefulWidget {

  ItemCardView({Key key, }) : super(key: key);

  @override
  _ItemCardViewState createState() {
    return _ItemCardViewState();
  }
}

class _ItemCardViewState extends State<ItemCardView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.only(left: 16,right: 16),
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
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 200/1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              "https://pbs.twimg.com/media/D3J321iU8AEgSU0.jpg"))),
                ),
                SizedBox(height: 4.0,),
                SizedBox(width:MediaQuery.of(context).size.width / 2.5,child: Text("CVG Transmart Cempaka Putih",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))),
                Text("0.56 km",style: TextStyle(fontSize: 12)),
              ],
            ),

          );
        },
      ),
    );
  }
}

