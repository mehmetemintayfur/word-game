import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wordgame/stateData.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Provider.of<StateData>(context, listen: false).resetSelected();
              });
            },
            child: Container(
              color: Colors.red,
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                    (Provider.of<StateData>(context).input).toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 32)),
              ),
              color: const Color.fromRGBO(61, 64, 91, 1),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Provider.of<StateData>(context, listen: false).checkInput();
              });
            },
            child: Container(
              color: Colors.green,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          )
        ],
      ),
    );
  }
}
