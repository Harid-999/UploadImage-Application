import 'package:flutter/material.dart';
import 'package:termproject/Drawer.dart';

class Abount extends StatefulWidget {
Abount({
    this.name,
    this.lastname,
    this.code,
  });
  final String name, lastname, code;

  @override
  _AbountState createState() => _AbountState();
}

class _AbountState extends State<Abount> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new MyDrawer(),
        appBar: AppBar(
          // ignore: missing_required_param
          leading: IconButton(
            icon: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            "ข้อมูลผู้จัดทำ",
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: Center(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           SizedBox(height: 50),
                          // Profile image
                          Positioned(
                            top:
                                150.0, // (background container size) - (circle height / 2)
                            child: Container(
                              height: 160.0,
                              width: 160.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/รูปถ่าย.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Text(
                            "Harid Promsri",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Computer Engineering",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Rajamangala university of technology lanna",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "________________________________________________",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Phone: 082-1500-593",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          //SizedBox(height: 50),
                          Text(
                            "E-MAIL: harid_pr61@live.rmutl.ac.th",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "GitHub: Harid-999",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "***************************",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
