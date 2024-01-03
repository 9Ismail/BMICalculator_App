import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  const HeightWidget({super.key,required this.onChange});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              'Height',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: TextStyle(fontSize: 40,),
                ),
                SizedBox(width: 10,),
    
                Text('cm',style: TextStyle(fontSize: 20,color: Colors.grey),)
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              activeColor: Colors.black,
              thumbColor: Colors.black,
              value:_height.toDouble(),
               onChanged:(value){
                     setState(() {
                       _height=value.toInt();
                     });
                     widget.onChange(_height);
               }
               )
          ],
        ),
      ),
    );
  }
}
