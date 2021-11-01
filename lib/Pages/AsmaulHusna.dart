import 'package:flutter/material.dart';
import 'package:json/main.dart';
class AsmaulHusna extends StatefulWidget {
  const AsmaulHusna({Key? key}) : super(key: key);

  @override
  _AsmaulHusnaState createState() => _AsmaulHusnaState();
}

class _AsmaulHusnaState extends State<AsmaulHusna> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonAsmaulHusna(),
        builder: (context,data){
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    for(int i=0;i<(listAsmaulHusna.length);i++)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 0.3)
                        ),
                        // color: Colors.pink,
                        child: ListTile(
                          onTap: (){},
                          title: Text(listAsmaulHusna[i]['latin'].toString()),
                          subtitle: Text(listAsmaulHusna[i]['arti'].toString()),
                          leading: CircleAvatar(
                            child: Text(listAsmaulHusna[i]['urutan'].toString()),
                          ),
                          trailing: Text(listAsmaulHusna[i]['arab'].toString()),
                        ),
                      ),
                    // Text(listAsmaulHusna[i]["surat_name"])

                  ],
                ),
              ),
            ],
          );
        });
  }
}
