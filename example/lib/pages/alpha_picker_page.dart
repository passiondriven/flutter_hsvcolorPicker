import "package:flutter/material.dart";
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class AlphaPickerPage extends StatefulWidget {
  @override
  AlphaPickerPageState createState() => AlphaPickerPageState();
}

class AlphaPickerPageState extends State<AlphaPickerPage> {
  int value = 0;
  void onChanged(int value) => this.value = value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 260,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  this.value.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Divider(),

                ///---------------------------------
                AlphaPicker(
                  alpha: this.value,
                  onChanged: (value) => super.setState(
                    () => this.onChanged(value),
                  ),
                )

                ///---------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
