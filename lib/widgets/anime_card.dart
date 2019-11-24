import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final double score;
  final String title;
  final String type;
  final int rank;

  const AnimeCard({
    this.score,
    this.rank,
    this.type,
    this.title
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 300.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 20.0, top: 8.0, bottom: 8.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                shadows: <Shadow>[
                  new Shadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  )
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Score ${score.toString()}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        shadows: <Shadow>[
                          new Shadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          )
                        ]
                      ),
                    ),
                  ),
                  Text('Rank ${rank.toString()}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
