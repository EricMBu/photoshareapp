// import 'dart:html';

import 'dart:typed_data';

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

  List<Uint8List> _imageFileList = [];

  // set _imageFile(XFile? value) {
  //   _imageFileList = value == null ? null : [value];
  // }

  Future getImage() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (photo != null) {
      final bytes = await photo.readAsBytes();
      setState(() {
        _imageFileList.add(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PhotoShare"),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Text(
      //     "add a photo",
      //     style: TextStyle(
      //       fontSize: 20.0,
      //       color: Colors.grey[600],
      //       fontFamily: 'Poppins',
      //     ),
      //   ),
      // ),
      body: ListView.builder(
          itemCount: _imageFileList.length,
          itemBuilder: (context, index) {
            final image = _imageFileList[index];
            return Image.memory(image);
          }),
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
