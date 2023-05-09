import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  /*
  List<Map<String, dynamic>> gridMap = [
    {
      "title": "Badminton",
      "owner": "John Lim",
      "location": "Location: CCK CC",
      "time": "Time: 9-10",
      "images": Image.asset('assets/bad.png'),
    },
    {
      "title": "Soccer",
      "owner": "Andy Tom",
      "location": "Location: Yishun CC",
      "time": "Time: 12-2",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "Bowling",
      "owner": "John",
      "location": "Location: Changi CC",
      "time": "Time: 4-6",
      "images":
          "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
    },
    {
      "title": "Skating",
      "owner": "Andy",
      "location": "Location: Jurong CC",
      "time": "Time: 1-5",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "title": "Volleyball",
      "owner": "Lim",
      "location": "Location: Woodlands CC",
      "time": "Time: 2-3",
      "images":
          "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
    },
    {
      "title": "Tennis",
      "owner": "Tom",
      "location": "Location: Bedok CC",
      "time": "Time: 10-2",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    }
  ];*/

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<List<PlaceInfo>> _getData() async {
    var data = await http.get(Uri.parse(
        'https://match-a5d38-default-rtdb.asia-southeast1.firebasedatabase.app/Users/Ben/History.json'));

    Map jsonData = json.decode(data.body);

    List<PlaceInfo> datas = [];

    setState(() {
      jsonData.forEach((key, value) {
        PlaceInfo newData = PlaceInfo(
          value['Location'],
          value['Owner'],
          value['Sport'],
          value['Time'],
          value[''],
        );

        datas.add(newData);
      });
    });
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                    width: 388,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        hintStyle: const TextStyle(),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: 'Search...',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(08),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[300],
        foregroundColor: Colors.deepOrange[400],
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: _getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: const Center(
                        child: Text('Loading...'),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                        onRefresh: _getData,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18, right: 16, bottom: 15),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 3,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Image.asset(
                                              'images/bad.png',
                                              height: 85,
                                              width: 70,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index].sport,
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'Greycliff CF',
                                                      fontSize: 20,
                                                      letterSpacing: 1.2,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  snapshot.data[index].owner,
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'Greycliff CF',
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: Text(
                                                        snapshot.data[index]
                                                            .location,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'Greycliff CF',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: Text(
                                                        snapshot
                                                            .data[index].time,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'Greycliff CF',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  "",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ));
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class PlaceInfo {
  final String location;
  final String owner;
  final String sport;
  final String time;
  String? image;

  PlaceInfo(this.location, this.owner, this.sport, this.time, this.image);
}
