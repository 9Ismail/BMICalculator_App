import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class BmiScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  BmiScoreScreen({super.key, required this.bmiScore, required this.age});

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = 'obese';
      bmiInterpretation = 'Please Work to reduce obesity';
      bmiStatusColor = Colors.red;
    } else if (bmiScore >= 25) {
      bmiStatus = 'overWeight';
      bmiInterpretation = 'Do Regular exercise and reduce weight';
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = 'Normal';
      bmiInterpretation = 'Enjoy!, You Are Fit';
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = 'UnderWeight';
      bmiInterpretation = 'Do Regular exercise and increase weight';
      bmiStatusColor = Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI SCORE'),
          backgroundColor: Colors.black87,
        ),
        body: Container(
            // width: 800,
            // height: 800,
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Score',
                      style: TextStyle(fontSize: 30, color: Colors.black87),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: PrettyGauge(                     
                        gaugeSize: 200,
                        minValue: 0,
                        maxValue: 40,
                        segments: [
                          GaugeSegment('UnderWeight', 18.5, Colors.red),
                          GaugeSegment('Normal', 6.5, Colors.green),
                          GaugeSegment('OverWeight', 5, Colors.yellow),
                          GaugeSegment('Obese', 10.1, Colors.blue),
                        ],
                        valueWidget: Text(
                          bmiScore.toStringAsFixed(1),
                          style: TextStyle(fontSize: 40),
                        ),
                        currentValue: bmiScore.toDouble(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.of(context).pop();
                              Navigator.pop(context);
                            },
                            child: Text('Calculate Again')),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  'Your BMI is ${bmiScore.toStringAsFixed(1)} at the age of $age');
                            },
                            child: Text('Share'))
                      ],
                    )
                  ]),
            )));
  }
}
