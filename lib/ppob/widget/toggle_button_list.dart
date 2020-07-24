import 'package:flutter/material.dart';
import 'package:ovo_app/models/paketdata_mdl.dart';

class ToogleButtonList extends StatefulWidget {
  ToogleButtonList({Key key, this.onSelected}) : super(key: key);
  final Function onSelected;

  @override
  _ToogleButtonListState createState() {
    return _ToogleButtonListState();
  }
}

class _ToogleButtonListState extends State<ToogleButtonList> {
  final isSelected = <bool>[];
  var contentWidget = List<Widget>();

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
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Color colorText = isSelected[index] ? Colors.white : Colors.black54;
        return InkWell(
          onTap: () {
            setState(() {
              setSelected(index);
            });
          },
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: isSelected[index]
                    ? Theme.of(context).primaryColorLight
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1.0, color: Colors.black45)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  getDummyList()[index].title,
                  style:
                      TextStyle(fontWeight: FontWeight.w700, color: colorText),
                ),
                Text(
                  "Rp${getDummyList()[index].price}",
                  style: TextStyle(color: colorText),
                )
              ],
            ),
          ),
        );
      },
      itemCount: getDummyList().length,
    );
  }

  List<PaketdataMdl> getDummyList() {
    List<PaketdataMdl> mList = new List();
    for (int i = 0; i < 9; i++) {
      mList.add(PaketdataMdl.init(i,"Telkomsel ${i * 10}", (i * 10000), false));

      isSelected.add(mList[i].isSelected);
    }
    return mList;
  }

  void setSelected(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = false;
    }
//            isSelected[index].isSelected =true;
    isSelected[index] = true;
    widget.onSelected(getDummyList()[index]);
  }
}
