import 'package:flutter/material.dart';
import 'package:ovo_app/home/home_page.dart';
import 'package:ovo_app/payment_confirm/payment_confirm_page.dart';
import 'package:ovo_app/utils/icon_assets.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPagesState createState() {
    return _MainPagesState();
  }
}

class _MainPagesState extends State<MainPage> {

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text("Riwayat"),
    Text("Inbox"),
    Text("Akun"),

  ];

  String barcode = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectedTab(int index) {
    setState(() {

      _selectedIndex = index;
      print(index);
    });
  }
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentConfirmPage()));
        print(barcode);
        });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
      'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "StickPay",
            style:
            TextStyle(fontFamily: "CoralPen", fontWeight: FontWeight.w700),
          ),
          centerTitle: false,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: null),
                Positioned(
                    right: 11.0,
                    top: 11.0,
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      constraints:
                      BoxConstraints(minHeight: 12.0, minWidth: 12.0),
                    ))
              ],
            )
          ],
        ),
        body: Container(color: Colors.white, child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           scan();
          },
          child: Image.asset(
            IconAssets.iconScanQr,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: FaBottomAppbar(
          notchedShape: CircularNotchedRectangle(),
          color: Colors.black45,
          selectedColor: Theme.of(context).accentColor,
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: "Home"),
            FABBottomAppBarItem(iconData: Icons.receipt, text: "Riwayat"),
            FABBottomAppBarItem(iconData: Icons.message, text: "Inbox"),
            FABBottomAppBarItem(iconData: Icons.person, text: "Akun"),
          ],
        ));
  }
}


class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class FaBottomAppbar extends StatefulWidget {
  FaBottomAppbar(
      {Key key,
      this.items,
      this.onTabSelected,
      this.color,
      this.selectedColor,
      this.notchedShape})
      : super(key: key);
  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;

  @override
  _FaBottomAppbarState createState() {
    return _FaBottomAppbarState();
  }
}



class _FaBottomAppbarState extends State<FaBottomAppbar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {

      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
          item: widget.items[index], index: index, onPressed: _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  Widget _buildTabItem(
      {FABBottomAppBarItem item, int index, ValueChanged<int> onPressed}) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    FontWeight fontWeight = _selectedIndex == index ? FontWeight.bold: FontWeight.normal;
    return Expanded(
        child: SizedBox(
      height: 60,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            onPressed(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                item.iconData,
                color: color,
                size: 24,
              ),
              Text(
                item.text,
                style: TextStyle(color: color,fontSize: 12,fontWeight: fontWeight),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24),
              Text(
                'Scan',style: TextStyle(fontSize: 12,color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

