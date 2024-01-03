import 'dart:math';


import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../widget/gender.dart';
import '../widget/height_widget.dart';
import '../widget/ageweight_widget.dart';
import '../screens/bmiScore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height:MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                //creating Gender widget
                Gender(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),

                HeightWidget(
                  onChange: (heightVal) {
                    _height = heightVal;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            _age = ageVal;
                          },
                          title: 'Age',
                          initValue: 30,
                          min: 0,
                          max: 100),
                      SizedBox(
                        width: 10,
                      ),
                      AgeWeightWidget(
                          onChange: (weightVal) {
                            _weight = weightVal;
                          },
                          title: 'Weight (kg)',
                          initValue: 50,
                          min: 0,
                          max: 200),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child: BmiScoreScreen(
                                  bmiScore: _bmiScore,
                                  age: _age,
                                ),
                                type: PageTransitionType.fade));
                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        Future.delayed(Duration(seconds: 1), () {
                          //calculate BMI here
                          calculateBmi();
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.black87,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black87,
                      ),
                      buttonText: 'CALCULATE'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
