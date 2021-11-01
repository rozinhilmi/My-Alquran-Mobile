import 'package:flutter/material.dart';
import 'package:json/Pages/DoaItem.dart';

import '../main.dart';
import 'Surat.dart';

class HalamanDoa extends StatefulWidget {
  const HalamanDoa({Key? key}) : super(key: key);

  @override
  _HalamanDoaState createState() => _HalamanDoaState();
}

class _HalamanDoaState extends State<HalamanDoa> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJsonListDoa(),
        builder: (context,data){
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    for(int i=0;i<(listDoa.length);i++)
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 0.3)
                        ),

                        child: ListTile(

                          onTap: (){
                            // print(i.toString());
                            Navigator.push(context, Transition(DoaItem(i)));
                          },
                          title: Text(listDoa[i]['judul'].toString()),
                          // trailing: Text(listDoa[i]['footnote'].toString()),
                        ),
                      )
                    // Text(listDoa[i]["surat_name"])

                  ],
                ),
              ),
            ],
          );
    });
    // return Container();

  }
}

































