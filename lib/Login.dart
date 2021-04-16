import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:termproject/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Timer _timer;
  //ouble _progress;
  @override
  void initState() {
    super.initState();
    
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
  }

  final _formKey = GlobalKey<FormState>();
  String msg ='';

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
//https://stackoverflow.com/questions/65131882/e-flutter-16289-errorflutter-lib-ui-ui-dart-state-cc177-unhandled-except
  Future<List> _login() async {
    final response = await http.post("http://10.0.2.2/termproject/login.php", body: {
      "username": user.text,
      "password": pass.text
    });
    print(response.body);

    var datauser = json.decode(response.body);
    if(datauser.length == 0){
      setState(() {
        msg = "เข้าสู่ระบบล้มเหลว...";
      });
    }else{
      Navigator.pushReplacementNamed(context, '/HomePage');
      setState(() {
        EasyLoading.dismiss();
        name = datauser[0]['name'];
        lastname = datauser[0]['lastname'];
        code = datauser[0]['code'];
        department = datauser[0]['department'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แอปพลิเคชั่นจัดเตรียมรูปภาพก่อนการเทรนโมเดล", style: TextStyle(fontSize:18),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              //padding: EdgeInsets.only(top: 50, bottom: 50),
              alignment: Alignment.topCenter,
              //color: Colors.black,
              width: 200,
              height: 30,
              child: Text(
                "ลงชื่อเข้าใช้งาน",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    inherit: true,
                    color: Colors.black,
                    shadows: [
                      Shadow(offset: Offset(2, -2), color: Colors.white)
                    ]),
              ),
            ),
            //Text("${user[0].username}"),
            //Text("${user[i].username}",
            SizedBox(
              height: 50,
            ),
            Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: user,
                    validator: (String input){
                      if(input.isEmpty){
                        return "กรุณากรอกชื่อเข้าใช้";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person), labelText: "ชื่อผู้ใช้"),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    validator: (String input){
                      if (input.isEmpty){
                        return "กรุณากรอกรหัสผ่าน";
                      }else{
                        return null;
                      }
                    },
                    style: TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "รหัสผ่าน",
                    ),
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                      onPressed: () {
                        bool pass = _formKey.currentState.validate();
                        if(pass){
                          EasyLoading.show(status: 'กำลังเข้าสู่ระบบ...');
                          _login();
                        }
                      },
                      child: Text("เข้าสู่ระบบ"),
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                    ),
                    SizedBox(width:20),
                    ElevatedButton(
                      onPressed: () {
                        EasyLoading.dismiss();
                        user.clear();
                        pass.clear();
                        setState(() {
                          msg ='';
                        });
                      },
                      child: Text("ล้างฟอร์ม"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ]),
                  Text(msg, style: TextStyle(fontSize: 20, color: Colors.red),),
                ])),
          ],
        ),
      ),
    );
  }
}
