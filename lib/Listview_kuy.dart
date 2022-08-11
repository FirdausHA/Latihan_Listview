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
        SiswaModel[index].Gender,
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
            SiswaModel[index].name,
            style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            child: Text(SiswaModel[index].Kelas),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: Text(SiswaModel[index].Hobi),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),      child: Text(SiswaModel[index].Alamat),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Data Siswa PPLG 1"),),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: SiswaModel.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: () => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
              title: Text("Hapus Kontak"),
              content: Text("Anda yakin ingin menghapus kontak ${SiswaModel[index].name}?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ya"),
                  onPressed: (){
                    setState(() {
                      SiswaModel.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Tidak"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
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




