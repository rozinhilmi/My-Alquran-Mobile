import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:json/Pages/AsmaulHusna.dart';
import 'package:json/Pages/Doa.dart';
import 'HomePage.dart';



class MyApp extends StatefulWidget {
  var currentIndex;
  MyApp(this.currentIndex);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var thisPage;
    double displayWidth = MediaQuery.of(context).size.width;
    if(widget.currentIndex == 0){
      setState(() {
        thisPage = Center(child: HomePage(),);
      });

    }
    else if(widget.currentIndex == 1) {
      setState(() {
        thisPage = Center(child: HalamanDoa(),);
      });
    }
    else if(widget.currentIndex == 2){
      setState(() {
        thisPage = Center(child: AsmaulHusna(),);
      });

    }
    else if(widget.currentIndex == 3){
      setState(() {
        thisPage = Center(child: AsmaulHusna(),);
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.currentIndex == 0 ? 'Al-Quran' : widget.currentIndex == 1 ? "Doa" :"Asmaul Husna",
        ),

      ),


      body: thisPage,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),

        ),
        child: ListView.builder(
          itemCount: 4,

          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.symmetric(horizontal: displayWidth * .0),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                widget.currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == widget.currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == widget.currentIndex ? displayWidth * .12 : 0,
                    width: index == widget.currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == widget.currentIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == widget.currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                            index == widget.currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == widget.currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == widget.currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                            index == widget.currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == widget.currentIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  List<IconData> listOfIcons = [
    Icons.book,
    Icons.collections_bookmark,
    Icons.book,
    Icons.book,
  ];

  List<String> listOfStrings = [
    'Al-Quran',
    'Doa',
    'Asmaul',
    'Asmaul'
  ];
}