import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:termproject/Drawer.dart';
import 'main.dart';


class Upload extends StatefulWidget {
  Upload({
    this.name,
    this.lastname,
    this.code,
  });
  final String name, lastname, code;

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Asset> images = [];
  Dio dio = Dio();
  static const UPLOAD_URL = 'http://10.0.2.2/termproject/upload.php';

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#000000",
          actionBarTitle: "เลือกรูปทั้งหมด",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  _saveImages() async {
    if (images != null) {
      int count = 0;
      for (var i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();

        MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          //filename: "$code"+images[i].name, 
          filename: images[i].name,
          contentType: MediaType('image', 'jpg'),
        );

        FormData fromData = FormData.fromMap({
          "image": multipartFile,
          "code" : code
          });
        EasyLoading.show(status: 'กำลังเพิ่มรูปภาพ...');
        var respone = await dio.post(UPLOAD_URL, data: fromData);
        if (respone.statusCode == 200) {
          count ++;
          EasyLoading.showSuccess('เพิ่มรูปที่ $count สำเร็จ..');
          print(respone.data);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new MyDrawer(),
        appBar: AppBar(
          // ignore: missing_required_param
          leading: IconButton(
              icon: Icon(Icons.arrow_left, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/HomePage');
              }),
          title: Text(
            "เพิ่มรูปภาพ",
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
        body: Container(
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                "โปรดเลือกรูปภาพที่เห็นใบหน้าชัดเจน!!",
                style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
              )),
            ),
            Text("รหัสนักศึกษาที่ใช้ผูกกับรูปภาพคือ: $code "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: loadAssets,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('เลือกรูปภาพ',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: _saveImages,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('บันทึกรูปภาพ',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: buildGridView(),
            ),
          ]),
        ));
  }
}
