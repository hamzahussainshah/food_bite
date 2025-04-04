import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../ui/common/app_colors.dart';
import '../ui/widgets/custom_logger/custom_logger.dart';

class FilePickerService {
  File? selectedImage;
  final _imagePicker = ImagePicker();
  final Logger logger = CustomLogger(className: 'FilePickerService');

  ///picks an image from gallery and returns a compressed [File]
  Future<File?> pickImageWithCompression({int imageQuality = 50}) async {
    File? selectedImage;
    final image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: imageQuality);
    if (image != null) selectedImage = File(image.path);

    logger.d('@pickImageWithCompression: Image Size: ${await image?.length()}');
    return selectedImage;
  }

  ///picks an image from Camera and returns a compressed [File]
  Future<File?> pickImageFromCameraWithCompression(
      {int imageQuality = 50}) async {
    File? selectedImage;
    final image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: imageQuality);
    if (image != null) selectedImage = File(image.path);

    logger.d('@pickImageWithCompression: Image Size: ${await image?.length()}');
    return selectedImage;
  }

  // Private method
  static Future<File?> _pickImageAndCrop(
      {required Future<File?> Function(File file)? cropImage}) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);
      return cropImage(file);
    }
  }

  Future<File?> selectAndCropImage(
      {bool isCircle = true, double height = 1.4}) async {
    File? file = await _pickImageAndCrop(cropImage: (File ss) {
      return _onShowcaseImageCrop(ss, isCircle, height);
    });

    return file;
  }

  // Private method
  Future<File?> _onShowcaseImageCrop(
      File file, bool isCircle, double height) async {
    var croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
      compressQuality: 15,
      //aspectRatio: CropAspectRatio(ratioX: 2, ratioY: isCircle ? 2 : height),
      //aspectRatioPresets: [CropAspectRatioPreset.original],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.red90,
          toolbarWidgetColor: AppColors.gray500,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    } else {
      return null;
    }
  }
}
