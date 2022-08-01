import 'dart:io';
import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    this.data,
  });

  List<ImageModelData>? data;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    data: List<ImageModelData>.from(json["data"].map((x) => ImageModelData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data!=null ? List<dynamic>.from(data!.map((x) => x.toJson())): [],
  };
}

class ImageModelData {
  ImageModelData({
    this.path,
  });

  String? path;

  File? pathToFile(){
    if(this.path!=null)
      return File(this.path!);
  }

  factory ImageModelData.fromJson(Map<String, dynamic> json) => ImageModelData(
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}
