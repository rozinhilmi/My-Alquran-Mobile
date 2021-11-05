import 'package:flutter/material.dart';
import 'package:json/main.dart';
class Dzikir extends StatefulWidget {
  const Dzikir({Key? key}) : super(key: key);

  @override
  _DzikirState createState() => _DzikirState();
}

class _DzikirState extends State<Dzikir> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red
            ),
            onPressed: (){
              setState(() {
                dzikirCounter = 0;
              });

            },
            child: Container(height: 100,width: double.infinity,child: Center(child: Text("Reset",style: TextStyle(fontSize: 30),))),
          ),
          CircleAvatar(
            backgroundColor: isDark == true ? Colors.grey : Colors.blue,
            radius: 70,
            child: Text(dzikirCounter.toString(),style: TextStyle(color: Colors.white,fontSize: 40),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green
            ),
            onPressed: (){
              setState(() {
                dzikirCounter += 1;
              });
            },
            child: Container(height: 100,width: double.infinity,child: Center(child: Text("Tap",style: TextStyle(fontSize: 30),))),
          )
        ],
      ),
    );
  }
}
