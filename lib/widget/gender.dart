import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class Gender extends StatefulWidget {
  final Function(int) onChange;

  const Gender({Key? key, required this.onChange}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unSelectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[200]!,
      borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: Colors.black12),
              style: _gender == 1 ? selectedStyle : unSelectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 1,
              child: Column(children: [
                Image.asset(
                  'assets/images/male.png',
                  width: 50,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Male')
              ])),
          SizedBox(
            width: 20,
          ),
          ChoiceChip3D(
              border: Border.all(color: Colors.black12),
              style: _gender == 2 ? selectedStyle : unSelectedStyle,
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 2,
              child: Column(children: [
                Image.asset(
                  'assets/images/woman.png',
                  width: 50,
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Female'),
              ]))
        ],
      ),
    );
  }
}
