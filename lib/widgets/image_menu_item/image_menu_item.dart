import 'package:colorgame/models/image_model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageMenuItem extends StatelessWidget {
  final List<ImageModel> imageList;
  final String title;
  final String asset;
  final Widget navigatePage;
  const ImageMenuItem({Key? key, required this.imageList, required this.title, required this.asset, required this.navigatePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Get.to(()=>navigatePage);
      },
      child: Container(
        width: size.width,
        height: 100,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(fontFamily: 'McLaren'),),
            Flexible(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length>5?5:imageList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    "assets/$asset/${imageList[index].path}",
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: (size.width-250)/6,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
