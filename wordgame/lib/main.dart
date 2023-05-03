import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordgame/components/falseKeeper.dart';
import 'package:wordgame/components/footer.dart';
import 'package:wordgame/components/letterTable.dart';
import 'package:wordgame/components/scoreContainer.dart';
import 'package:wordgame/stateData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StateData>(
          create: (_) => StateData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: Text("Word Game"),
              backgroundColor: Color.fromRGBO(77, 113, 96, 1)),
          body: Column(
            children: [
              ScoreContainer(),
              LetterTable(),
              Footer(),
              FalseKeeper()
            ],
          ),
        ),
      ),
    );
  }
}
