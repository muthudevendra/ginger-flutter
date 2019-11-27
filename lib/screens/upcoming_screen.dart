import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ginger/repositories/anime_repository.dart';
import 'package:ginger/services/network_provider.dart';
import 'package:ginger/widgets/anime_card.dart';

AnimeRepository _animeRepository = new AnimeRepository();

class UpcomingScreen extends StatefulWidget {
  static String id = 'upcoming';
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  initState() {
    super.initState();
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _connectionChangeStream.cancel();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  Widget renderAnimeItem(imageUrl, title, rank, episodes, score, type) {
    return new Container(
      height: 100.0,
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0, right: 24.0),
      child: new Stack(
        children: <Widget>[
          AnimeCard(
            title: title, rank: rank, score: score, type: type
          ),
          Container(
            alignment: FractionalOffset.centerLeft,
            child: Image(
              image: NetworkImage(imageUrl),
              height: 80.0,
              width: 92.0,
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
          child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
      ),
      appBar: AppBar(
        title: Text('Upcoming'),
        centerTitle: true,
        backgroundColor: Colors.orange,
         leading: new IconButton(icon: new Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: !isOffline ? _animeRepository.fetchUpcomingAnimeList() : null,
          builder: (context, snapshot) {
            if (snapshot.hasData) {          
              return ListView(
                children: <Widget>[
                  for(var item in snapshot.data)
                    renderAnimeItem(
                      item['image_url'],
                      item['title'],
                      item['rank'],
                      0.0,
                      0.0,
                      item['type']
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
            );
          },
        ),
      ),
    );
  }
}