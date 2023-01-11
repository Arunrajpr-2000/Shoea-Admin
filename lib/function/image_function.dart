import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageFunctions {
  static ImagePicker _imagePicker = ImagePicker();
  static List addImage(List images, String imgUrl) {
    // if (images.length < 5) {
    //   return images;
    // } else {
    //   images.add(imgUrl);
    //   return images;
    // }
    images.add(imgUrl);
    return images;
  }

  static Future<String?> getImage() async {
    final xfile = await ImageFunctions.selectImage();
    if (xfile != null) {
      String imgUrl = await ImageFunctions.uploadImage(xfile);
      return imgUrl;
    } else {
      return null;
    }
  }

  static Future<XFile?> selectImage() async {
    final xfile = (await _imagePicker.pickImage(source: ImageSource.gallery));
    if (null != xfile) {
      // file = File(xfile.path);
    }
    return xfile;
  }

  static Future<String> uploadImage(XFile xfile) async {
    final path = 'images/${xfile.name}';
    log('Path: ${path.toString()}');
    final file = File(xfile.path);
    log('file: ${file.toString()}');

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);
    // log('uploadTask: ${uploadTask}');
    log('image ${xfile.name} uploaded to fire storage');
    final snapshot = await uploadTask.whenComplete(() {});
    // log('snapshot : ${snapshot}');
    final imageUrl = await snapshot.ref.getDownloadURL();
    log('ImageUrl : $imageUrl');
    return imageUrl;
  }
}
