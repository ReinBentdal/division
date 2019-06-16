import 'package:flutter/material.dart';
import 'package:division/division.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final StyleClass titleBox = StyleClass()
    ..padding(vertical: 30.0, horizontal: 20.0);

  final StyleClass tasksCard = StyleClass()
    ..width(100)
    ..height(100)
    ..borderRadius(all: 15.0)
    ..margin(left: 10.0, right: 10.0, top: 5.0, bottom: 55.0);

  final StyleClass categoriesCard = StyleClass()
    ..width(200)
    ..height(200)
    ..borderRadius(all: 15.0)
    ..backgroundColor('#ffffff')
    ..elevation(25)
    ..align('top')
    ..margin(left: 10.0, right: 10.0, top: 10.0, bottom: 55.0);

  Widget _buildTitle(String title) {
    return Division(
      style: titleBox,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Division(
      style: StyleClass()
        ..width(300)
        ..padding(horizontal: 20.0, vertical: 15.0)
        ..margin(top: 0.0, bottom: 20.0)
        ..borderRadius(all: 10.0)
        ..align('center')
        ..elevation(15, color: Colors.grey)
        ..backgroundColor('#ffffff'),
      child: Text(
        'Search..',
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTasksCardRow() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildColoredCard(Color(0xFFFFB85D)),
          _buildColoredCard(Color(0xFFFD5C63)),
          _buildColoredCard(Color(0xFF828AFF)),
          _buildColoredCard(Color(0xFF55ffff)),
        ],
      ),
    );
  }

  Widget _buildColoredCard(Color color) {
    return Division(
      style: StyleClass()
        ..backgroundColor(color)
        ..elevation(20,
            color: color.withOpacity(0.5))
        ..add(tasksCard),
    );
  }

  Widget _buildUnderTitle(String title) {
    return Division(
        style: StyleClass()..margin(left: 20.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
          textAlign: TextAlign.left,
        ));
  }

  Widget _buildCategoriesCardRow() {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildCategoriesCard(),
          _buildCategoriesCard(),
        ],
      ),
    );
  }

  Widget _buildCategoriesCard() {
    return Division(style: categoriesCard);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle('Home'),
          _buildSearchBar(),
          _buildUnderTitle('Tasks'),
          _buildTasksCardRow(),
          _buildUnderTitle('Categories'),
          _buildCategoriesCardRow()
        ],
      ),
    );
  }
}
