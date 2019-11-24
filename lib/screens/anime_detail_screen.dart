import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatefulWidget {
  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      height: 250.0,
      child: Hero(
  tag: 'imageHero',
  child: Image.network(
    'https://picsum.photos/250?image=9',
  ),
              ),
    );
  }
}