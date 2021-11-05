import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:json/Pages/AsmaulHusna.dart';
import 'package:json/Pages/Doa.dart';
import 'package:json/Pages/Dzikir.dart';
import '../main.dart';
import 'HomePage.dart';
import 'Zakat.dart';



class MyApp extends StatefulWidget {
  var currentIndex;
  MyApp(this.currentIndex);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isAlquranSearch = false;
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
        thisPage = Center(child: Dzikir(),);
      });
    }
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: isDark == false ? Colors.white : Colors.black,
            child: ListView(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isDark == true ? Colors.grey : Colors.blue
                    ),
                    onPressed: (){
                      Navigator.push(context,Transition(Zakat()));
                    },
                    child: Text("Zakat")
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: isDark == true ? Color.fromRGBO(40,36,36, 1) : null,
          centerTitle: true,
          title: !isAlquranSearch ?
          Center(
            child: Text(
              widget.currentIndex == 0 ? 'Al-Quran' : widget.currentIndex == 1 ? "Doa" : widget.currentIndex == 2 ? "Asmaul Husna" : "Dzikir",
            ),
          ) :

          TextField(
            onSubmitted: (value) {
              setState(() {
                alquranSearch = value.toString();
              });
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                icon: Icon(Icons.search_rounded, color: Colors.white),
                hintText: "search surat",
                hintStyle: TextStyle(color: Colors.white)),
          ),
          actions: <Widget>[
            isAlquranSearch
                ? IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  this.isAlquranSearch = !this.isAlquranSearch;
                  alquranSearch = "";
                });
              },
            )
                : IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {
                setState(() {
                  this.isAlquranSearch = !this.isAlquranSearch;
                });
              },
            )
          ],


        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: isDark == true ? (Colors.black) : (Colors.blue),
          onPressed: (){},
          child: IconButton(
            icon: isDark == true ? Icon(Icons.dark_mode) : Icon(Icons.wb_sunny ),
            onPressed: (){
              setState(() {
                if(isDark == true){
                  isDark = false;
                  print(isDark);
                }
                else{
                  isDark = true;
                  print(isDark);
                }
              });
            },
          ),
        ),
        backgroundColor: isDark == true ? Color.fromRGBO(48,44,44, 1) : Colors.white,



        body: thisPage,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: displayWidth * .05),
          height: displayWidth * .155,
          decoration: BoxDecoration(
            color: Colors.transparent ,
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
                            ? isDark == false ? Colors.blueAccent.withOpacity(.2) : Colors.white.withOpacity(.6)
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
                                  color: isDark == false ? Colors.blueAccent : Colors.black ,
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
                            ImageIcon(

                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: index == widget.currentIndex
                                  ? isDark == false ? Colors.blueAccent : Colors.black
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

  List<AssetImage> listOfIcons = [
    AssetImage("icon/Alquran.png"),
    AssetImage("icon/doa.png"),
    AssetImage("icon/asmaul_husna.png"),
    AssetImage("icon/dzikir.png"),
  ];

  List<String> listOfStrings = [
    'Al-Quran',
    'Doa',
    'Asmaul',
    'Dzikir',
  ];
}