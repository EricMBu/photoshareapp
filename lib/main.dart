// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//state
class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();

  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  Future getImage() async {
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PhotoShare"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "add a photo",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[600],
            fontFamily: 'Poppins',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Text("add photo"),
      ),
    );
  }

  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    throw UnimplementedError();
  }
}
