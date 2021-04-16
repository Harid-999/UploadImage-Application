import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:termproject/main.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {

  MyDrawer({this.name, this.lastname, this.code});
  final String name, lastname, code;
  
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,size: 100,),
                          Text("$name $lastname", style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
                      ],
                    ))),
            ListTile(
              title: Text(
                'หน้าแรก: ข้อมูลนักศึกษา',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/HomePage');
              },
            ),
            ListTile(
              title: Text(
                'เพิ่มรูปภาพ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                EasyLoading.showInfo('กดปุ่มเลือกรูปภาพ แล้วกดบันทึก..');
                Navigator.pushReplacementNamed(context, '/Upload');
              },
            ),
            ListTile(
              title: Text(
                'คลังรูปภาพ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // _postCodeToServer();
                Navigator.pushReplacementNamed(context,'/Gallery', );
              },
            ),
            ListTile(
              title: Text(
                'ข้อมูลผู้จัดทำ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // _postCodeToServer();
                Navigator.pushReplacementNamed(context,'/Abount', );
              },
            ),
            ListTile(
              title: Text(
                'คู่มือแนะนำการใช้งาน',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () { 
                _launchURL();
              },
            ),
            ListTile(
              title: Text(
                'ออกจากระบบ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                EasyLoading.showToast('ออกจากระบบแล้วครับ');
                Navigator.pushReplacementNamed(context, '/Login');
              },
            ),
          ],
        ),
      );
  }
  _launchURL() async {
  const url = 'https://youtu.be/pqz1D4WZIFw';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
    
}