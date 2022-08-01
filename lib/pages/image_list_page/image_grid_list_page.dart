import 'package:colorgame/widgets/image_grid_item/image_grid_item.dart';
import 'package:flutter/material.dart';

import '../../models/image_model/image_model.dart';

class ImageGridListPage extends StatefulWidget {
  final List<ImageModelData> dataList;
  final String asset;
  const ImageGridListPage(
      {Key? key, required this.dataList, required this.asset})
      : super(key: key);

  @override
  State<ImageGridListPage> createState() => _ImageGridListPageState();
}

class _ImageGridListPageState extends State<ImageGridListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(widget.dataList.length, (index) {
            return Center(
              child: ImageGridItem(
                path: widget.dataList[index].path ?? "",
                asset: widget.asset,
              ),
            );
          })),
    );
  }
}
