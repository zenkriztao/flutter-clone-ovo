class PaketdataMdl {
  int id;
  String title;
  int price;
  bool isSelected;

  static PaketdataMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    PaketdataMdl paketdataMdlBean = PaketdataMdl();
    paketdataMdlBean.title = map['title'];
    paketdataMdlBean.price = map['price'];
    return paketdataMdlBean;
  }

  static PaketdataMdl init(int id,String title, int price,bool isSelected) {
    PaketdataMdl paketdataMdlBean = PaketdataMdl();
    paketdataMdlBean.title = title;
    paketdataMdlBean.price = price;
    paketdataMdlBean.isSelected = isSelected;
    paketdataMdlBean.id = id;
    return paketdataMdlBean;
  }

  Map toJson() => {
        "title": title,
        "price": price,
      };
}
