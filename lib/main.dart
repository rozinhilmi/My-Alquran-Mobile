import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'Pages/MainPage.dart';




dynamic listSurah;
dynamic surah;
dynamic listDoa;
dynamic listAsmaulHusna;


Future<void> readJsonListSurah() async {
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = await json.decode(response);
  listSurah =  data['data'];
}
Future<void> readJsonSurahItem(idSurah) async {
  final String response = await rootBundle.loadString('assets/Surat/'+idSurah.toString()+".json");
  final data = await json.decode(response);
  surah = data['data'];
}

Future<void> readJsonListDoa() async {
  final String response = await rootBundle.loadString('assets/doa-sehari-hari.json');
  final data = await json.decode(response);
  listDoa =  data;
}

Future<void> readJsonAsmaulHusna() async {
  final String response = await rootBundle.loadString('assets/asmaul-husna.json');
  final data = await json.decode(response);
  listAsmaulHusna =  data;
}

String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

bool isDark = false;

String alquranSearch = "";

int dzikirCounter = 0;

double hasilZakat = 0;


void main() {


  runApp(MaterialApp(

    home: MyApp(0),
  ));
}





class Transition extends PageRouteBuilder {
  final Widget page;

  Transition(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}


