import 'package:flutter/material.dart';

import 'palette_picker.dart';
import 'slider_picker.dart';

class PaletteValuePicker extends StatefulWidget {
  const PaletteValuePicker({
    required this.color,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final HSVColor color;
  final ValueChanged<HSVColor> onChanged;

  @override
  _PaletteValuePickerState createState() => _PaletteValuePickerState();
}

class _PaletteValuePickerState extends State<PaletteValuePicker> {
  HSVColor get color => super.widget.color;

  // Value
  void valueOnChange(double value) => super.widget.onChanged(
        color.withValue(value),
      );
  List<Color> get valueColors => <Color>[
        Colors.black,
        color.withValue(1.0).toColor(),
      ];

  // Hue Saturation
  void hueSaturationOnChange(Offset value) => super.widget.onChanged(
        HSVColor.fromAHSV(color.alpha, value.dx, value.dy, color.value),
      );
  // Hue
  final List<Color> hueColors = <Color>[
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 255, 0),
    const Color.fromARGB(255, 0, 255, 0),
    const Color.fromARGB(255, 0, 255, 255),
    const Color.fromARGB(255, 0, 0, 255),
    const Color.fromARGB(255, 255, 0, 255),
    const Color.fromARGB(255, 255, 0, 0)
  ];
  // Saturation
  final List<Color> saturationColors = <Color>[
    Colors.transparent,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Palette
        SizedBox(
          height: 280.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: PalettePicker(
              position: Offset(color.hue, color.saturation),
              onChanged: hueSaturationOnChange,
              rightPosition: 360.0,
              leftRightColors: hueColors,
              topPosition: 1.0,
              bottomPosition: 0.0,
              topBottomColors: saturationColors,
            ),
          ),
        ),

        // Slider
        SliderPicker(
          value: color.value,
          onChanged: valueOnChange,
          colors: valueColors,
        )
      ],
    );
  }
}
