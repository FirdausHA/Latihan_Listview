import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_listview/DetailPage.dart';
import 'package:latihan_listview/PremierLeagueFootball.dart';

class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> {
  PremierLeagueFootball? premierLeagueFootball;
  bool isloaded = true;



  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premierLeagueFootball =
        PremierLeagueFootball.fromJson(json.decode(res.body.toString()));
    print("team 1 : " + premierLeagueFootball!.teams![1].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return isloaded
        ? Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            body: ListView.builder(
                itemCount: premierLeagueFootball!.teams!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  teams:
                                      premierLeagueFootball!.teams![index])));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                  child: Image.network(premierLeagueFootball!
                                      .teams![index].strTeamBadge
                                      .toString())),
                            ),
                            Container(
                              child: Text(
                                premierLeagueFootball!.teams![index].strTeam
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Spacer(),

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          );
  }
}
