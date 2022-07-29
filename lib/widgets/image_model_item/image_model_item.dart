import 'package:flutter/material.dart';

class ImageModelItem extends StatelessWidget {
  final String path;
  const ImageModelItem({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(path),
    );
  }
}
