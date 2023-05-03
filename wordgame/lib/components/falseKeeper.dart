import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../stateData.dart';

class FalseKeeper extends StatefulWidget {
  const FalseKeeper({super.key});

  @override
  State<FalseKeeper> createState() => _FalseKeeperState();
}

class _FalseKeeperState extends State<FalseKeeper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Provider.of<StateData>(context).falsekeeper[0]
                  ? Colors.red
                  : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Provider.of<StateData>(context).falsekeeper[1]
                  ? Colors.red
                  : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Provider.of<StateData>(context).falsekeeper[2]
                  ? Colors.red
                  : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
