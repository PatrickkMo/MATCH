import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List myIds = [];
  List myServiceNames = [];
  List myImagesUrl = [];
  late bool isLogin;
  TextEditingController searchFieldController = TextEditingController();

  List<Map<String, dynamic>> gridMap = [
    {
      "title": "Badminton",
      "owner": "John Lim",
      "location": "Location: CCK CC",
      "time": "Time: 9-10",
      "images":
          "https://images.unsplash.com/photo-1564226803380-91139fdcb4d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "title": "Soccer",
      "owner": "Andy Tom",
      "location": "Location: Yishun CC",
      "time": "Time: 12-2",
      "images":
          "https://images.unsplash.com/photo-1574629810360-7efbbe195018?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1593&q=80",
    },
    {
      "title": "Bowling",
      "owner": "John",
      "location": "Location: Changi CC",
      "time": "Time: 4-6",
      "images":
          "https://images.unsplash.com/photo-1614713568397-b31b779d0498?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1125&q=80",
    },
    {
      "title": "Skating",
      "owner": "Andy",
      "location": "Location: Jurong CC",
      "time": "Time: 1-5",
      "images":
          "https://images.unsplash.com/photo-1566796195789-d5a59f97235b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
    },
    {
      "title": "Volleyball",
      "owner": "Lim",
      "location": "Location: Woodlands CC",
      "time": "Time: 2-3",
      "images":
          "https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1607&q=80",
    },
    {
      "title": "Tennis",
      "owner": "Tom",
      "location": "Location: Bedok CC",
      "time": "Time: 10-2",
      "images":
          "https://images.unsplash.com/flagged/photo-1576972405668-2d020a01cbfa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80",
    }
  ];
  // This list holds the data for the list view
  List<dynamic> _foundUsers = [];

  @override
  initState() {
// at the beginning, all users are shown
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = gridMap;
    } else {
      results = gridMap
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

// Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: searchFieldController,
                      onChanged: (value) => _runFilter(value),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 180,
        ),
        padding: const EdgeInsets.only(left: 12, right: 12),
        itemCount: _foundUsers.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    "${gridMap.elementAt(index)['images']}",
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontFamily: 'Greycliff CF',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${gridMap.elementAt(index)['owner']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              const TextStyle(
                                fontFamily: 'Greycliff CF',
                              ),
                            ),
                      ),
                      Text(
                        "${gridMap.elementAt(index)['location']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              const TextStyle(
                                fontFamily: 'Greycliff CF',
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
