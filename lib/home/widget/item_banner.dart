import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.only(left: 16,right: 16),

        itemBuilder: (context, index) {
          return Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          "https://images-loyalty.ovo.id/public/deal/31/95/l/25239.jpg?ver=1"))),
            ),
          );
        },
      ),
    );
  }
}
