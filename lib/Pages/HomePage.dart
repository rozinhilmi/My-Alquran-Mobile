import 'package:flutter/material.dart';
import '../main.dart';
import 'Surat.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonListSurah(),
        builder: (context,data){
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                for(int i=0;i<(listSurah.length);i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 0.3)
                    ),
                    // color: Colors.pink,
                    child: ListTile(

                      onTap: (){

                        Navigator.push(context, Transition(Surat(listSurah[i]["id"])));
                      },
                      title: Text(listSurah[i]['surat_name'].toString()),
                      subtitle: Text(listSurah[i]['surat_text'].toString()),
                      leading: CircleAvatar(
                        child: Text(listSurah[i]['id'].toString()),
                      ),
                      trailing: Text(listSurah[i]['count_ayat'].toString()+ " ayat")
                    ),
                  ),
                // Text(listSurah[i]["surat_name"])

              ],
            ),
          ),
        ],
      );
    });





  }
}
