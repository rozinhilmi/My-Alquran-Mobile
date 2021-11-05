import 'package:flutter/material.dart';
import 'package:json/main.dart';

class Zakat extends StatefulWidget {
  // const Zakat({Key? key}) : super(key: key);

  @override
  _ZakatState createState() => _ZakatState();
}

class _ZakatState extends State<Zakat> {
  @override
  Widget build(BuildContext context) {
    double kebutuhanBulanan = 0;
    double pendapatanBulanan = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                hasilZakat = 0 ;
                Navigator.of(context).pop();

              },
                  icon: Icon(Icons.arrow_back)),
              Text("Zakat Counter"),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.transparent,))
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                onChanged: (valuekey){
                  pendapatanBulanan = int.parse(valuekey).toDouble();
                },
                decoration: InputDecoration(

                  labelText: "Jumlah Pengahasilan Bulanan",
                ),

              ),
              TextField(
                onChanged: (valuekey){
                  kebutuhanBulanan = int.parse(valuekey).toDouble();
                },
                decoration: InputDecoration(

                  labelText: "Jumlah Kebutuhan Bulanan",
                ),

              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      hasilZakat = (pendapatanBulanan*12)-(kebutuhanBulanan*12);
                      hasilZakat = (2.5/100) * hasilZakat;
                      print(hasilZakat);
                    });
                  },
                  child: Text("Tampilkan Zakat")
              ),
              Text("hasil Zakat = "+hasilZakat.toString(),style: TextStyle(fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}
