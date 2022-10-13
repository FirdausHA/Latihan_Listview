import 'package:flutter/material.dart';
import 'package:latihan_listview/PremierLeagueFootball.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'Database_League.dart';
import 'Favorite_Football_Model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool checkExist = false;

  Future read() async {
    checkExist =
        await FootballDatabase.instance.read(widget.teams.strTeam.toString());
    setState(() {});
  }

  Future addData() async {
    var list;
    list = PremierLeagueFootballFav(
        title: widget.teams.strTeam.toString(),
        teambadge: widget.teams.strTeamBadge.toString());
    await FootballDatabase.instance.create(list);
    setState(() {
      checkExist = true;
    });
  }

  Future deleteData() async {
    await FootballDatabase.instance.delete(widget.teams.strTeam.toString());
    setState(() {
      checkExist = false;
    });
  }

  Future<void> _launchInBrowsor(String url) async {
    if (await launchUrlString(url)) {
      await launch(url);
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 230,
              child: Image.network(widget.teams.strStadiumThumb.toString(),
                  fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.only(right: 36, left: 30, top: 25),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 70,
                    width: 70,
                    child: Image.network(widget.teams.strTeamBadge.toString()),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        widget.teams.strTeam.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                        child: Text(
                          widget.teams.strStadium.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite, size: 30),
                      color: checkExist
                          ? Colors.red
                          : Colors.black.withOpacity(.5),
                      onPressed: () {
                        checkExist ? deleteData() : addData();
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(75))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 40),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.teams.strDescriptionEN.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            var newUrl = "https://" +
                                widget.teams.strFacebook.toString();

                            _launchInBrowsor(newUrl);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "https://www.facebook.com/images/fb_icon_325x325.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            var newUrl = "https://" +
                                widget.teams.strInstagram.toString();

                            _launchInBrowsor(newUrl);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/1200px-Instagram-Icon.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            var newUrl =
                                "https://" + widget.teams.strTwitter.toString();

                            _launchInBrowsor(newUrl);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/1200px-Twitter-logo.svg.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            var newUrl =
                                "https://" + widget.teams.strYoutube.toString();

                            _launchInBrowsor(newUrl);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "https://yt3.ggpht.com/584JjRp5QMuKbyduM_2k5RlXFqHJtQ0qLIPZpwbUjMJmgzZngHcam5JMuZQxyzGMV5ljwJRl0Q=s900-c-k-c0x00ffffff-no-rj"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
