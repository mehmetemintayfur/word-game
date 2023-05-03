import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wordgame/components/letter.dart';
import 'package:wordgame/main.dart';
import 'package:wordgame/stateData.dart';

class LetterTable extends StatefulWidget {
  const LetterTable({super.key});

  @override
  State<LetterTable> createState() => _LetterTableState();
}

class _LetterTableState extends State<LetterTable> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      abc();
    });
  }

  Future<void> abc() async {
    Provider.of<StateData>(context, listen: false).restartMatrix();
    Provider.of<StateData>(context, listen: false).setagainscore(0);
    build3row();
    await Future.delayed(Duration(seconds: 5));
    final score = Provider.of<StateData>(context, listen: false).score;

    int interval;
    if (score < 100) {
      interval = 5;
    } else if (score >= 100 && score < 200) {
      interval = 4;
    } else if (score >= 200 && score < 300) {
      interval = 3;
    } else if (score >= 300 && score < 400) {
      interval = 2;
    } else {
      interval = 1;
    }

    Timer.periodic(Duration(seconds: interval), (timer) {
      if (!mounted ||
          Provider.of<StateData>(context, listen: false).flag == true) {
        timer.cancel();
        return;
      }

      setState(() {
        buildLetter();
        print('buildLetter fonksiyonu çağrıldı.');
      });
    });
  }

  void build3row() {
    Random random = new Random();
    for (var l = 1; l < 4; l++) {
      for (var k = 0; k < 8; k++) {
        Color randomColor = Provider.of<StateData>(context, listen: false)
            .colors[random.nextInt(7)];

        if (Provider.of<StateData>(context, listen: false).matrix[l][k] == '') {
          Provider.of<StateData>(context, listen: false).setMatrix(
              'AAAABBCÇDEEEEEEFGĞHIIİİJKKLLMMNNOÖPRRSŞTTUUÜVYZ'[
                  random.nextInt(47)],
              l,
              k);
          Provider.of<StateData>(context, listen: false)
              .setVisibility(true, l, k);
          Provider.of<StateData>(context, listen: false)
              .setColor(randomColor, l, k);
        }
      }
    }

    Duration duration3 = Duration(seconds: 4);
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (mounted) {
        Provider.of<StateData>(context, listen: false).ccheck1();
        Provider.of<StateData>(context, listen: false).ccheck2();
        Provider.of<StateData>(context, listen: false).ccheck3();
        Provider.of<StateData>(context, listen: false).ccheck4();
        Provider.of<StateData>(context, listen: false).ccheck5();
        Provider.of<StateData>(context, listen: false).ccheck6();
        Provider.of<StateData>(context, listen: false).ccheck7();
        Provider.of<StateData>(context, listen: false).ccheck8();

        Future.delayed(duration3, () {
          t.cancel();
        });
      } else {
        t.cancel();
      }
    });
  }

  void buildLetter() {
    Random random = new Random();
    int selectLetterType = random.nextInt(20);
    int randomNumber = random.nextInt(8);
    if (selectLetterType == 3) {
      if (Provider.of<StateData>(context, listen: false).matrix[1]
              [randomNumber] ==
          '') {
        var l = '*';
        Provider.of<StateData>(context, listen: false)
            .setMatrix(l, 1, randomNumber);
        Provider.of<StateData>(context, listen: false)
            .setColor(Color.fromARGB(255, 194, 43, 205), 1, randomNumber);
        Provider.of<StateData>(context, listen: false)
            .setVisibility(true, 1, randomNumber);
        Provider.of<StateData>(context, listen: false)
            .goldenLetter(randomNumber);
        Provider.of<StateData>(context, listen: false).setScore(10);
      } else {
        Provider.of<StateData>(context, listen: false).changeFlag();
        final scoreData = Provider.of<StateData>(context, listen: false);
        scoreData.scores.add(scoreData.score);
        scoreData.setagainscore(scoreData.score);
        var k = Provider.of<StateData>(context, listen: false).matrix[1]
            [randomNumber];
        scoreData.restartMatrix();
        final scores = scoreData.scores;
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Skor Tablosu'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < scores.length; index++)
                    Text(
                      '${index + 1}. ${scores[index]}',
                      style: TextStyle(
                        fontSize: 24,
                        color: scoreData.score == scores[index]
                            ? Colors.red
                            : null,
                      ),
                    ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                    scoreData.restartMatrix();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      if (Provider.of<StateData>(context, listen: false).matrix[1]
              [randomNumber] ==
          '') {
        var l = 'AAAABBCÇDEEEEEEFGĞHIIİİJKKLLMMNNOÖPRRSŞTTUUÜVYZ'[
            random.nextInt(47)];
        Provider.of<StateData>(context, listen: false)
            .setMatrix(l, 1, randomNumber);
        Color randomColor = Provider.of<StateData>(context, listen: false)
            .colors[random.nextInt(7)];
        Provider.of<StateData>(context, listen: false)
            .setColor(randomColor, 1, randomNumber);
        Provider.of<StateData>(context, listen: false)
            .setVisibility(true, 1, randomNumber);
        Duration duration5 = Duration(seconds: 3);
        Timer.periodic(Duration(milliseconds: 1500), (Timer t) {
          if (mounted) {
            Provider.of<StateData>(context, listen: false).ccheck1();
            Provider.of<StateData>(context, listen: false).ccheck2();
            Provider.of<StateData>(context, listen: false).ccheck3();
            Provider.of<StateData>(context, listen: false).ccheck4();
            Provider.of<StateData>(context, listen: false).ccheck5();
            Provider.of<StateData>(context, listen: false).ccheck6();
            Provider.of<StateData>(context, listen: false).ccheck7();
            Provider.of<StateData>(context, listen: false).ccheck8();

            Future.delayed(duration5, () {
              t.cancel();
            });
          } else {
            t.cancel();
          }
        });
      } else {
        Provider.of<StateData>(context, listen: false).changeFlag();
        final scoreData = Provider.of<StateData>(context, listen: false);
        scoreData.scores.add(scoreData.score);
        scoreData.setagainscore(scoreData.score);
        var k = Provider.of<StateData>(context, listen: false).matrix[1]
            [randomNumber];
        scoreData.restartMatrix();
        final scores = scoreData.scores..sort((a, b) => b.compareTo(a));
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Skor Tablosu'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < scores.length; index++)
                    Text(
                      '${index + 1}. ${scores[index]}',
                      style: TextStyle(
                        fontSize: 24,
                        color: scoreData.score == scores[index]
                            ? Colors.red
                            : null,
                      ),
                    ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                    scoreData.restartMatrix();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.61,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 8,
        children: List.generate(80, (index) {
          return Letter(index: index);
        }),
      ),
    );
  }
}
