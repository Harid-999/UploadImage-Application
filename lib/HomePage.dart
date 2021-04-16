import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:termproject/Drawer.dart';
import 'package:termproject/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {

  HomePage({this.name, this.lastname, this.code, this.department});
  final String name, lastname, code, department;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

int result=0;
String status_result = 'กดปุ่มเพื่อเช็คสถานะรูป';
bool styleOBJ = true;


Future _statusImg() async {
    final response = await http.post("http://10.0.2.2/termproject/checkImg.php", body: {
      "code": code,
    });
    print(response.body);

    var datauser = json.decode(response.body);
    print(datauser);
    setState(() {
     result = datauser;
     if (result >=10){
       styleOBJ = false ;
       status_result = 'ครบ';
       //EasyLoading.dismiss();
       EasyLoading.showSuccess('ครบแล้วครับ');
     }else{
       status_result = 'ยังไม่ครบ';
       //EasyLoading.dismiss();
       EasyLoading.showError('ยังไม่ครบครับ');
     }
    });
    return datauser;
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
            Icons.person,
            color: Colors.white
          ),
        ),
        title: Text("หน้าแรก: ข้อมูลนักศึกษา", style: TextStyle(fontSize:15),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ), 
            onPressed: () => _scaffoldKey.currentState.openDrawer(),)
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Icon(Icons.person),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person, size: 150,),
                    Text("ชื่อ-นามสกุล: $name $lastname", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                    Text("รหัสนักศึกษา: $code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("แผนก: $department", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                            EasyLoading.show(status: 'เช็คสถานะรูปภาพ...');
                            _statusImg();
                        },
                        child: Text("เช็คสถานะรูปภาพ"),
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      ),
                      SizedBox(height: 20),
                      Text("จำนวนรูปภาพ $result/10 รูป", style: TextStyle(fontSize:20, ),),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        //https://flutter-examples.com/change-text-font-color-size-style/
                        Text("สถานะ: ", style: TextStyle(fontSize:20 , ),),
                        Text("$status_result", style: styleOBJ
                            ? TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold)
                            : TextStyle(color:Colors.green, fontSize: 30, fontWeight: FontWeight.bold),),
                      ]
                    ),
                  ]
                ),
              ),
            ]
          ),
      )
    );
  }
}