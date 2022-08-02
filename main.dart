import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List shoplist = [];
  TextEditingController t = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible( // listeyi ekrana sığdırır
              child: ListView.builder( //kaydırılabilir liste
                itemCount: shoplist.length,
                  itemBuilder: (context, index) => ListTile(
                    subtitle: Text("Shopping Things"),
                        title: Text(shoplist[index]),
                      ))),
          TextField(
            controller: t,
          ),
          RaisedButton(
              onPressed: () {
                setState(() {
                  shoplist.add(t.text);
                  t.clear(); //textfield alanı temizlenir
                });
              },
              child: Text("Add")),
          RaisedButton(
              onPressed: () {
                setState(() {
                  shoplist.remove(t.text);
                });
              },
              child: Text("Remove")),
        ],
      ),
    );
  }
}
