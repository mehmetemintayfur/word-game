import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wordgame/stateData.dart';

import '../main.dart';

class ScoreContainer extends StatefulWidget {
  const ScoreContainer({super.key});

  @override
  State<ScoreContainer> createState() => _ScoreContainerState();
}

class _ScoreContainerState extends State<ScoreContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(129, 178, 154, 1),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text("Score:", style: TextStyle(fontSize: 30)),
              SizedBox(width: 50),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: 80.0,
                height: 60.0,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "${Provider.of<StateData>(context).score}",
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Provider.of<StateData>(context, listen: false).restartMatrix();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Container(
              color: Colors.green,
              child: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
