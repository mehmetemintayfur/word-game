import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wordgame/stateData.dart';

class Letter extends StatefulWidget {
  final int index;
  Letter({required this.index});

  @override
  State<Letter> createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  List<int> convertedValues = [0, 0];
  String userinput = '';
  @override
  Widget build(BuildContext context) {
    void convert(int sayi) {
      int j = sayi % 8;
      int i = (sayi / 8).floor();
      setState(() {
        convertedValues[0] = i;
        convertedValues[1] = j;
      });
    }

    convert(widget.index);
    return Container(
        child: GestureDetector(
      onTap: () {
        Provider.of<StateData>(context, listen: false)
            .setSelected(convertedValues[0], convertedValues[1]);
        if (Provider.of<StateData>(context, listen: false)
                .isSelected[convertedValues[0]][convertedValues[1]] ==
            true) {
          Provider.of<StateData>(context, listen: false).setInput(
              Provider.of<StateData>(context, listen: false)
                  .matrix[convertedValues[0]][convertedValues[1]]);
        } else {
          Provider.of<StateData>(context, listen: false).removeChars(
              Provider.of<StateData>(context, listen: false)
                  .matrix[convertedValues[0]][convertedValues[1]]);
          userinput = '';
        }
      },
      child: Container(
        color: Provider.of<StateData>(context).lettercolor[convertedValues[0]]
            [convertedValues[1]],
        child: Center(
            child: Text(
          "${Provider.of<StateData>(context).matrix[convertedValues[0]][convertedValues[1]]}"
              .toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans',
              color: Provider.of<StateData>(context)
                      .isSelected[convertedValues[0]][convertedValues[1]]
                  ? Colors.white
                  : Colors.black),
        )),
      ),
    ));
  }
}
