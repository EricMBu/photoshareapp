import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ImagePicker _picker = ImagePicker();

  final List<Uint8List> _imageFileList = [];

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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("PhotoShare"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Text("add photo"),
      ),
      body: GridView.builder(
        itemCount: _imageFileList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final image = _imageFileList[index];
          return Image.memory(
            image,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
