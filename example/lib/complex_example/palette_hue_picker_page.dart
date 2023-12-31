import 'package:flutter/material.dart';

import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class PaletteHuePickerPage extends StatefulWidget {
  const PaletteHuePickerPage({Key? key}) : super(key: key);

  @override
  State<PaletteHuePickerPage> createState() => _PaletteHuePickerPageState();
}

class _PaletteHuePickerPageState extends State<PaletteHuePickerPage> {
  HSVColor color = HSVColor.fromColor(Colors.blue);
  void onChanged(HSVColor value) => color = value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        child: Card(
          shape: const RoundedRectangleBorder(
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
                  backgroundColor: color.toColor(),
                ),
                const Divider(),

                ///---------------------------------
                PaletteHuePicker(
                  color: color,
                  onChanged: (value) => super.setState(
                    () => onChanged(value),
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
