import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoshare/application/controllers/home_controller.dart';
import 'package:photoshare/presentation/widgets/folder_card.dart';
import 'package:photoshare/presentation/widgets/get_string_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("PhotoShare"),
            centerTitle: true,
          ),
          body: controller.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.galleryFolders.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (_, index) {
                          final item = controller.galleryFolders[index];

                          return FolderCard(
                            folderName: item,
                            onPressed: () => controller.navigateToFolder(item),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text('Create new folder'),
                        onPressed: () => createNewFolder(controller),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Future<void> createNewFolder(HomeController controller) async {
    await Get.dialog(
      GetStringDialog(
        title: 'New Folder Name',
        onSubmit: (value) => controller.createFolder(value),
      ),
    );
  }
}
