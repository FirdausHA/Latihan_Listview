import 'package:flutter/material.dart';
import 'package:latihan_listview/Listview_kuy.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> with SingleTickerProviderStateMixin {

  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.contact_phone)),
    Tab(icon: Icon(Icons.auto_mode)),
    Tab(icon: Icon(Icons.call
    )),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text("Tabbar"),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            listview(),
            Center(child: Text("Not Found")),
            Center(child: Text("Tab 3")),
          ],
        ),
      ),
    );
  }
}