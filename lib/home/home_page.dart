import 'package:flutter/material.dart';
import 'package:ovo_app/home/widget/appbar_balance.dart';
import 'package:ovo_app/home/widget/dasboard_grid.dart';
import 'package:ovo_app/home/widget/flash_deal.dart';
import 'package:ovo_app/home/widget/item_banner.dart';
import 'package:ovo_app/home/widget/item_card.dart';
import 'package:ovo_app/utils/helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: AppbarBalance(
              expandedHeight: MediaQuery.of(context).size.width / 2.5),
        ),
        SliverPadding(
            padding: EdgeInsets.only(top: 56), sliver: DasboardGrid()),
        ListItem(title: "CashBack Bikin Melek",subtitle: "",itemChild: ItemBanner(),),
        FlashDealListView(backgroundImage: "https://malindoholidays.s3.amazonaws.com/landing/ODH-flashsalenov-landing.jpg",title: "Flash Sale",subtitle: "01 : 28 : 23",subtitleColor: Theme.of(context).primaryColor,subtitleFontWeight: FontWeight.bold,),
        ListItem(title: "Merchant Didekat Kamu",subtitle: "Ada banyak merchant menarik di sekitar kamu yang harus dicobain. Cek sekarang, yuk!",itemChild: ItemCardView(),),

      ],
    );
  }


}

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget itemChild;
  final Color subtitleColor;
  final FontWeight subtitleFontWeight;
  final Color backgroundColor;
  final String backgroundImage;
  final double paddingLeftChild;

  const ListItem({Key key,  this.backgroundColor,this.title, this.subtitle, this.itemChild, this.subtitleColor, this.subtitleFontWeight, this.backgroundImage, this.paddingLeftChild=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(

        decoration: BoxDecoration(
          image: backgroundImage!=null?DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(backgroundImage)): null
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16,bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                    ),

                    SizedBox(width: 17,),
                    Text(
                      "Lihat semua",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.0,width: 20,),
              Visibility(
                  visible: subtitle != "",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/1.7 ,
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 12,color: subtitleColor,fontWeight: subtitleFontWeight),
                      ),
                    ),
                  )),
              Padding(
                padding:  EdgeInsets.only(top: 16.0,left: paddingLeftChild),
                child: itemChild,
              )
            ],
          ),
        ),
      ),
    );
  }
}

