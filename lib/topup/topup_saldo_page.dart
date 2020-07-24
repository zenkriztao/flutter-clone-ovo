import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovo_app/models/topup_mdl.dart';
import 'package:ovo_app/utils/helper.dart';
import 'package:ovo_app/utils/icon_assets.dart';

class TopupSaldoPage extends StatelessWidget {
  TopupSaldoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Topup"),
      centerTitle: false,),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(itemBuilder: (context,index){


          return ItemViewTopup(context,getTopupList()[index]);
        },itemCount: getTopupList().length,),
      ),
    );
  }
  
  List<TopupMdl> getTopupList(){
    List<TopupMdl>mdls = new List();

      mdls.add(TopupMdl(1, "Transfer dari Bank", "Lewat AtM, M-Banking, Internet Banking sampai SMS Banking, Semuanya bisa!",IconAssets.iconBank));
      mdls.add(TopupMdl(1, "Kartu Debit", "Praktis dan aman, isi saldo langsung pakai kartu debit",IconAssets.iconCreditCard));
      mdls.add(TopupMdl(1, "Merchant d& Mitra StickPay", "Kunjungi merchant & mitra StickPay terdekat dari kamu",IconAssets.iconShop));

    return mdls;
  }

  Widget ItemViewTopup(BuildContext context, TopupMdl topupList) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: HexColor("#e1f5fe"),

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(topupList.iconUrl,width: 32,height: 32,),
        ),
      ),
      title: Text(topupList.title),
      subtitle: Text(topupList.description),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
      onTap: (){},


    );
  }
}

