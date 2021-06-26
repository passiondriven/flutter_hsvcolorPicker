import "package:flutter/material.dart";
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class RGBPickerPage extends StatefulWidget {
  @override
  RGBPickerPageState createState() => RGBPickerPageState();
}

class RGBPickerPageState extends State<RGBPickerPage> {
  Color color = Colors.blue;
  void onChanged(Color value) => this.color = value;

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
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: this.color,
                ),
                Divider(),

                ///---------------------------------
                RGBPicker(
                  color: this.color,
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
