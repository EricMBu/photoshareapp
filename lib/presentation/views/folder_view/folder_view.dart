import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoshare/application/controllers/folder_controller.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({
    Key? key,
    required this.folderName,
  }) : super(key: key);

  final String folderName;

  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return GetX<FolderController>(
      init: FolderController(widget.folderName),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.folderName),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: controller.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final img = controller.images[index];
                        return Image.memory(
                          img.rawBinary,
                          fit: BoxFit.contain,
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  child: const Text('Add new image'),
                  onPressed: () => controller.selectImage(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
