

import 'package:colorgame/assets_const.dart';
import 'package:flutter/material.dart';

import '../models/image_model/image_model.dart';

class MainProvider extends ChangeNotifier{
  List<ImageModel> animalList = [];
  List<ImageModel> flowersList = [];
  List<ImageModel> mattersList = [];
  List<ImageModel> plantsList = [];


  Future<void> loadData() async{
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
}