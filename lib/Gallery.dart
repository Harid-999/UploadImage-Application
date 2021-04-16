import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:termproject/Drawer.dart';
import 'package:http/http.dart' as http;
import 'package:termproject/main.dart';

class Gallery extends StatefulWidget {

  Gallery({this.name, this.lastname, this.code });
  final String name, lastname, code;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future allImage() async {
    var url ='http://10.0.2.2/termproject/gallery.php';
    var respone = await http.get(url);
     return json.decode(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new MyDrawer(),
      appBar: AppBar(
        // ignore: missing_required_param
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
            color: Colors.white
          ),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/Upload');
          }),
        title: Text("คลังรูปภาพ", style: TextStyle(fontSize:15),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ), 
            onPressed: () => _scaffoldKey.currentState.openDrawer(),)
        ], 
        backgroundColor: Colors.black,
        ),
      body: FutureBuilder(
        future: allImage(),
        builder: (context, snapshot){
          if(snapshot.hasError) print (snapshot.error);
          return snapshot.hasData ? ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          List list = snapshot.data;
          
          // String rubi = 'good';
          // String ore = 'good';
          //https://stackoverflow.com/questions/16255621/dart-string-comparator
          if((list[index]['code'] == "$code") == false){
            return Container();
          }else
          
          return GestureDetector(
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Image.network("http://10.0.2.2/termproject/img/${list[index]['image']}", width: 160,),
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         //SizedBox(width: 20,),
                        Text("รูปภาพที่: ${index+1}", style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                        Text("${list[index]['image']}", style: TextStyle(fontSize:20),),
                        Text("รูปของ ${list[index]['code']}", style: TextStyle(fontSize:15,),),
                       ]
                     )
                    ],
                  ),
              
          );
        }): Center(child: CircularProgressIndicator(),);
        },),
      );
  }
}