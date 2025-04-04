import 'dart:io';
import 'package:flutter/material.dart';

import 'custom_image_widget.dart';

class ShowImage extends StatelessWidget {
  final String imagePath;
  final String? imageType;

  const ShowImage({Key? key, required this.imagePath, this.imageType = 'file'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // body: Center(
      //   child: Image.file(
      //
      //     File(imagePath),
      //     fit: BoxFit.contain,
      //   ),
      // ),
      body: Center(
        child: CustomImageView(
          file: imageType == 'file' ? File(imagePath) : null,
          url: imageType == 'url' ? imagePath : null,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
