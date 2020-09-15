import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_master/IntrayPage.dart';
import 'package:http/http.dart' as http;
import 'global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: getUser(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  // Widget to display the list of project
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future getUser() async {
    var result = await http.get('http://127.0.0.1:5000/api/signup');
    print(result.body);
    return result;
  }
}

asyncFunc() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
}

Future<String> getApiKey() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String apiKey;
  try {
    apiKey = prefs.getString('API_KEY');
  } catch (Exception) {
    apiKey = "";
  }

  return apiKey;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Stack(children: <Widget>[
              TabBarView(
                children: [
                  IntrayPage(),
                  new Container(
                    color: darkGreyColor,
                  ),
                  new Container(
                    color: darkGreyColor,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Intray",
                      style: intrayTextTitle,
                    ),
                    Container(),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(
                    top: 120,
                    left: MediaQuery.of(context).size.width * 0.5 - 40),
                child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      size: 70,
                    ),
                    elevation: 0,
                    backgroundColor: redColor,
                    onPressed: () {}),
              ),
            ]),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: TabBar(
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tab(
                      icon: new Icon(
                        Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tab(
                      icon: new Icon(
                        Icons.rss_feed,
                        size: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tab(
                      icon: new Icon(
                        Icons.list,
                        size: 40,
                      ),
                    ),
                  ),
                ],
                labelColor: darkGreyColor,
                unselectedLabelColor: redColor,
                indicatorColor: Colors.transparent,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
