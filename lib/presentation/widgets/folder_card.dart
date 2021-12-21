import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  const FolderCard({
    Key? key,
    required this.folderName,
    required this.onPressed,
  }) : super(key: key);

  final String folderName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder),
            Text(folderName),
          ],
        ),
      ),
    );
  }
}
