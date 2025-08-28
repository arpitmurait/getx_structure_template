import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {

  Future<File?> pickProfilePicture() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return await _cropImageInCircle(image.path);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Image. Please select another image');
      log("Error while getting image: $e");
    }
    return null;
  }

  Future<File?> _cropImageInCircle(String filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.png,
      maxHeight: 500,
      maxWidth: 500,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Crop Your Image",
          lockAspectRatio: true,
          cropStyle: CropStyle.circle,
        ),
        IOSUiSettings(
          title: "Crop Your Image",
          aspectRatioLockEnabled: true,
          aspectRatioPickerButtonHidden: true,
          cropStyle: CropStyle.circle,
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    }
    return null;
  }

  Future<File?> pickNormalPicture({source = ImageSource.gallery}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source,imageQuality: 50);
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Image. Please select another image');
      log("Error while getting image: $e");
    }
    return null;
  }


}
