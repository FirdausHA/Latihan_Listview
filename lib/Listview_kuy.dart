import 'package:flutter/material.dart';
import 'package:latihan_listview/Siswa_Model.dart';


class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {


  Widget avatar(int index){
    return CircleAvatar(
      radius: 24,
      child: Text(
        namaModel[index].kodeName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget textData(int index){
    return Expanded(child: Container(
      margin: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            namaModel[index].name,
            style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Text(namaModel[index].jurusan),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Siswa kel.1 PPLG 1"),),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: namaModel.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: (){
              //snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${namaModel[index].name}"),
                duration: Duration(seconds: 2),
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  avatar(index),
                  textData(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




