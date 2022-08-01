import 'dart:io';

import 'package:colorgame/pages/image_color_page/image_color_page.dart';
import 'package:colorgame/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class ImageGridItem extends StatefulWidget {
  final String? path;
  final String? asset;
  final int? index;
  final File? file;
  const ImageGridItem({Key? key, this.path, this.asset, this.file, this.index})
      : super(key: key);

  @override
  State<ImageGridItem> createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (widget.asset != null && widget.path != null) {
            Get.to(() => ImageColorPage(
                  path: "assets/${widget.asset}/${widget.path}",
                ));
          } else {
            Get.to(() => ImageColorPage(
                  file: widget.file,
                  index: widget.index,
                ));
          }
        },
        child: Stack(
          children: [
            widget.asset != null && widget.path != null
                ? Image.asset("assets/${widget.asset}/${widget.path}")
                : Image.file(widget.file!),
          widget.index!=null ?  Align(
                alignment: Alignment.topRight,
                child: PopupMenuButton(
                    // Callback that sets the selected popup menu item.
                    onSelected: (_) {},
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            child: Text('Delete'),
                            onTap: () {
                              context.read<MainProvider>().deleteImage(index: widget.index);
                            },
                          ),
                        ])):SizedBox.shrink(),
          ],
        ));
  }
}
