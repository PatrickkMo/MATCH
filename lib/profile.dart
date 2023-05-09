// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 150.0,
                color: Colors.orange[200],
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Ben',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      tileColor: Colors.grey[300],
                      title: Text(
                        'My Sports',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        '-Basketball\n-Soccer\n-Badminton',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      tileColor: Colors.grey[300],
                      title: Text(
                        'My Achievements',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: Text(
                        '-1st place in Basketball Regional\n-Captain of the Basketball Team\n-1st place in community soccer competition',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 77.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/user.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
