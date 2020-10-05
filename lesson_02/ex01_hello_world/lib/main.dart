import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  debugPrintScheduleFrameStacks = true;
  runApp(MaterialApp(
    home: MarkNeedsBuild(),
  ));
}

class MarkNeedsBuild extends StatelessWidget {
  final bag = {"isRed": true};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless ??')),
      body: Container(
        child: Center(
          child: GestureDetector(
              child: Container(
                width: 50.0,
                height: 50.0,
                color: bag["isRed"] ? Colors.red : Colors.blue,
              ),
              onTap: () {
                bag["isRed"] = !bag["isRed"];
                //
                // This is the trick
                //
                (context as Element).markNeedsBuild();
              }),
        ),
      ),
    );
  }
}

//void main() {
//  debugPrintScheduleFrameStacks = true;
//
//  runApp(
//    Container(
//      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//      alignment: Alignment.center,
//      child: Text(
//        'Hello, world!!',
//        textDirection: TextDirection.ltr,
//        style: TextStyle(color: Colors.black, fontSize: 40),
//      ),
//    ),
//  );
//}

//void main() {
//  runApp(
//    MaterialApp(
//      home: Scaffold(
//        body: Center(
//          child: Text(
//            'Hello, world!!',
//            textDirection: TextDirection.ltr,
//          ),
//        ),
//      ),
//    ),
//  );
//}
