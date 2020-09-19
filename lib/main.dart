import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'sportpit.ru',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('sportpit.ru'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: getListView(),
      //floatingActionButton: FloatingActionButton(
      //  tooltip: 'Add', // used by assistive technologies
      //  child: Icon(Icons.add),
      //  onPressed: null,
      // ),
    );
  }
}

Widget getListView() {
  var listViev = ListView(
    children: <Widget>[
      ListTile(
        leading: Image.asset('images/pic3.png'),
        title: Text("Scitec Nutrition Isolate Amino"),
        subtitle: Text("500 капсул"),
        trailing: new Text("500 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        //trailing: Icon(Icons.airline_seat_flat),
      ),
      ListTile(
        leading: Image.asset('images/pic1.jpg'),
        title: Text("Scitec Nutrition Egg Pro"),
        subtitle: Text("900 г"),
        trailing: new Text("1200 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        //leading: CircleAvatar(backgroundImage: AssetImage('images/pic3.png')),
        leading: Image.asset('images/pic2.jpg'),
        title: Text("Scitec Nutrition Carni Complex"),
        subtitle: Text("60 капсул"),
        trailing: new Text("1000 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      //),
      ListTile(
        leading: Image.asset('images/pic4.jpg'),
        title: Text("Scitec Nutrition Attack 2.0"),
        subtitle: Text("320 г"),
        trailing: new Text("350 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic5.jpg'),
        title: Text("Scitec Nutrition Hot Blood 3.0"),
        subtitle: Text("20 г"),
        trailing: new Text("1500 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic6.jpg'),
        title: Text("Scitec Nutrition 3.0"),
        subtitle: Text("20 г"),
        trailing: new Text("1000 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic7.jpg'),
        title: Text("Optimum Nutrition 100% Whey Gold Standard"),
        subtitle: Text("20 г"),
        trailing: new Text("1400 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic8.jpg'),
        title: Text("Ultimate Nutrition Prostar 100% Whey Protein"),
        subtitle: Text("200 г"),
        trailing: new Text("5000 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic9.jpg'),
        title: Text("Optimum Nutrition Serious Mass"),
        subtitle: Text("5.44 кг"),
        trailing: new Text("3840 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic10.jpg'),
        title: Text("Ultimate Nutrition BCAA Powder 12000 Flavored"),
        subtitle: Text("457 г"),
        trailing: new Text("1880 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      ListTile(
        leading: Image.asset('images/pic11.jpg'),
        title: Text("Bombbar Protein Bar"),
        subtitle: Text("20 г"),
        trailing: new Text("100 р.",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
    ],
  );

  return listViev;
}
