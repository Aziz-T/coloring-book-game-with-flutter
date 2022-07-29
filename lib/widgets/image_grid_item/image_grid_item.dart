import 'package:colorgame/pages/image_color_page/image_color_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ImageGridItem extends StatelessWidget {
  final String path;
  final String asset;
  const ImageGridItem({Key? key, required this.path, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>ImageColorPage(path: "assets/$asset/${path}",));
      },
      child: Image.asset("assets/$asset/${path}"),
    );
  }
}
