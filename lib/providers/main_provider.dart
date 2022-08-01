import 'dart:io';

import 'package:colorgame/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import '../models/image_model/image_model.dart';

class MainProvider extends ChangeNotifier {

  List<ImageModel> animalList = [];
  List<ImageModel> flowersList = [];
  List<ImageModel> mattersList = [];
  List<ImageModel> plantsList = [];
  List<File> savedImageList = [];

  ui.Image? img;

  final LocalStorage storage = LocalStorage('coloring_app');

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

  Future<void> saveImage({required String name, int? index}) async {
    print("save image");
    print("name----------------->$name");
    if (img != null) {
      print("null değil");
      var pngBytes = await img!.toByteData(format: ui.ImageByteFormat.png);
      Directory appDocDir = await getTemporaryDirectory();
      String appDocPath = appDocDir.path;
      File file = File("$appDocPath/${name}.png")
        ..writeAsBytesSync(pngBytes!.buffer.asInt8List());
      if (index != null) {
        savedImageList.removeAt(index);
        savedImageList.add(file);
        notifyListeners();
      } else {
        savedImageList.add(file);
      }
    }
  }

  Future<void> deleteImage({int? index}) async {
    if (savedImageList.isNotEmpty && index != null) {
      savedImageList.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> _saveToStorage(List<File> list) async {
    storage.setItem('colored_images', list.asMap());
  }
}
