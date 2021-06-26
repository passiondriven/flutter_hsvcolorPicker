import 'package:flutter/material.dart';

class Hex {
  // Hex Number To Color
  static Color intToColor(int hexNumber) => Color.fromARGB(
        255,
        (hexNumber >> 16) & 0xFF,
        (hexNumber >> 8) & 0xFF,
        (hexNumber >> 0) & 0xFF,
      );

  // String To Hex Number
  static int stringToInt(String hex) => int.parse(hex, radix: 16);

  // String To Color
  static String colorToString(Color color) =>
      _colorToString(
        color.red.toRadixString(16),
      ) +
      _colorToString(
        color.green.toRadixString(16),
      ) +
      _colorToString(
        color.blue.toRadixString(16),
      );
  static String _colorToString(String text) =>
      text.length == 1 ? '0$text' : text;

  // Subste
  static String? textSubString(String? text) {
    if (text == null) return null;

    if (text.length < 6) return null;

    if (text.length == 6) return text;

    return text.substring(text.length - 6, 6);
  }
}

class HexPicker extends StatefulWidget {
  HexPicker({
    required this.color,
    required this.onChanged,
    Key? key,
  })  : controller = TextEditingController(
          text: Hex.colorToString(color).toUpperCase(),
        ),
        super(key: key);

  final Color color;
  final ValueChanged<Color> onChanged;
  final TextEditingController controller;

  @override
  _HexPickerState createState() => _HexPickerState();
}

class _HexPickerState extends State<HexPicker> {
  void textOnSubmitted(String value) => super.widget.onChanged(
        textOnChenged(value),
      );
  Color textOnChenged(String text) {
    final String? hex = Hex.textSubString(text);
    if (hex == null) return super.widget.color;

    try {
      return Hex.intToColor(Hex.stringToInt(hex));
    } catch (_) {
      return super.widget.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '#',
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
          ),
        ),

        // TextField
        Expanded(
          child: TextField(
            style:
                Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
            focusNode: FocusNode()..addListener(() {}),
            controller: super.widget.controller,
            onSubmitted: textOnSubmitted,
            decoration: const InputDecoration.collapsed(hintText: 'hex code'),
          ),
        )
      ],
    );
  }
}
