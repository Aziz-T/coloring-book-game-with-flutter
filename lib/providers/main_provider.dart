import 'dart:io';

import 'package:colorgame/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import '../models/image_model/image_model.dart';

class MainProvider extends ChangeNotifier {
  List<ImageModel> animalList = [];
  List<ImageModel> flowersList = [];
  List<ImageModel> mattersList = [];
  List<ImageModel> plantsList = [];
  ui.Image? img;

  Future<void> loadData() async {
    AssetsConst.animals.asMap().forEach((key, value) {
      animalList.add(ImageModel(path: value));
    });
    AssetsConst.flowers.asMap().forEach((key, value) {
      flowersList.add(ImageModel(path: value));
    });
    AssetsConst.matters.asMap().forEach((key, value) {
      mattersList.add(ImageModel(path: value));
    });
    AssetsConst.plants.asMap().forEach((key, value) {
      plantsList.add(ImageModel(path: value));
    });
    notifyListeners();
  }

  void setImage(ui.Image? image) {
    img = image;
    notifyListeners();
  }

  Future<void> saveImage() async {
    if (img != null) {
      var pngBytes = await img!.toByteData(format: ui.ImageByteFormat.png);
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      File('$appDocPath/filename.png')
          .writeAsBytesSync(pngBytes!.buffer.asInt8List());
    }
  }
}
