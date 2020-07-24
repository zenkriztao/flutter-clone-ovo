import 'package:flutter/material.dart';

import 'helper.dart';

class PrimaryButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;

  PrimaryButton({@required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      color: Theme.of(context).primaryColor,
      disabledColor: HexColor("#a191b3"),
      padding: EdgeInsets.all(16.0),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}

class PrimaryButtonSmall extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;

  PrimaryButtonSmall({@required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ButtonTheme(
      minWidth: 100,
      child: MaterialButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        color: HexColor("#4e277a"),
        disabledColor: HexColor("#804E277A"),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;

  SecondaryButton({@required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlineButton(

      highlightedBorderColor: HexColor("#4e277a"),
      borderSide: BorderSide(color: HexColor("#4e277a"), style: BorderStyle.solid, width: 2),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(16.0),
      child: Text(
        label,
        style: TextStyle(color: HexColor("#4e277a")),
      ),
      onPressed: onPressed,
    );
  }
}