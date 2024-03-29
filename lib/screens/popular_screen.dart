import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ginger/repositories/anime_repository.dart';
import 'package:ginger/services/network_provider.dart';
import 'package:ginger/widgets/anime_card.dart';

AnimeRepository _animeRepository = new AnimeRepository();

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

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
    print('IS OFFLINE: $isOffline');
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: !isOffline ? _animeRepository.fetchPopularAnimeList() : null,
          builder: (context, snapshot) {
            if (snapshot.hasData) {          
              return ListView(
                children: <Widget>[
                  for(var item in snapshot.data)
                    renderAnimeItem(
                      item['image_url'],
                      item['title'],
                      item['rank'],
                      item['episodes'],
                      item['score'],
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