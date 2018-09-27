import 'package:flutter/material.dart';
import 'ChatContent.dart';
import 'ChatGenerator.dart';
import 'CallContent.dart';
import 'CallGenerator.dart';
import 'StatusContent.dart';
import 'StatusGenerator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Icon iconContent;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            iconContent = Icon(Icons.message);
            break;
          case 1:
            iconContent = Icon(Icons.message);
            break;
          case 2:
            iconContent = Icon(Icons.camera_enhance);
            break;
          case 3:
            iconContent = Icon(Icons.call);
            break;
          default:
            iconContent = Icon(Icons.message);
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Whatsapp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )),
            backgroundColor: Color.fromRGBO(7, 94, 84, 1.0),
            actions: [
              new Padding(
                padding: EdgeInsets.only(right: 19.0),
                child: Icon(Icons.search),
              ),
              new Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.more_vert),
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(
                  child: Text("CHATS"),
                ),
                Tab(
                  child: Text("STATUS"),
                ),
                Tab(
                  child: Text("CALLS"),
                ),
              ],
              indicatorColor: Colors.white,
              controller: _tabController,
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: iconContent,
          backgroundColor: Color.fromRGBO(37, 211, 102, 1.0),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          Center(child: Text("Will Open Camera for pictures")),
          ListView.builder(
              itemCount: ChatGenerator.chatCount,
              itemBuilder: (context, position) {
                ChatContent chatContent =
                    ChatGenerator.getChatContent(position);
                return Column(children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                        Icon(Icons.account_circle, size: 64.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(chatContent.messageSender,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0)),
                                    Text(
                                      chatContent.messageTiming,
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, bottom: 2.0),
                                  child: Text(chatContent.messageContent,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ])),
                  Divider(),
                ]);
              }),
          ListView.builder(
              itemCount: StatusGenerator.statusCount,
              itemBuilder: (context, position) {
                StatusContent statusContent =
                    StatusGenerator.getStatusContent(position);
                return Column(children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                        Icon(Icons.account_circle, size: 64.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(statusContent.statusUploader,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, bottom: 2.0),
                                  child: Text(statusContent.statusTiming,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ])),
                  Divider(),
                ]);
              }),
          ListView.builder(
              itemCount: CallGenerator.totalCalls,
              itemBuilder: (context, position) {
                CallContent callContent =
                    CallGenerator.getCallDetails(position);
                return Column(children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                        Icon(Icons.account_circle, size: 64.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(callContent.callerName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0)),
                                    Icon(Icons.call,
                                        color:
                                            Color.fromRGBO(37, 211, 102, 1.0),
                                        size: 23.0)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, bottom: 2.0),
                                  child: Text(callContent.callTiming,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ])),
                  Divider(),
                ]);
              }),
        ]));
  }
}
