import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Json',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Json'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
   Future<List<Data>> getAllData() async{
      var api = "https://jsonplaceholder.typicode.com/photos";
      var data = await http.get(api);

      var jsonData = jsonDecode(data.body);

      List<Data> listOf = [];

      for(var i in jsonData){
        Data d = Data(i['id'], i["title"], i["url"], i["thumbnailUrl"]);
        listOf.add(d);
      }

      return listOf;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()=>debugPrint("search"),  // when pressed this will print into debug console
          ),
          
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: ()=>debugPrint("Options"),  // when pressed this will print into debug console
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ankit Vashisht"),
              accountEmail: Text("ankitvashisht12@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.blueAccent
              ),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            Divider(),

            ListTile(
              title: Text('About'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              title: Text('Help & Feedback'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

          ],
        ),
      ),
      
    );
  }
}
