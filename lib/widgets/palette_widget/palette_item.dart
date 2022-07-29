import 'package:flutter/material.dart';

class PaletteItem extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  const PaletteItem({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black45,width: 2)
          ),
        ));
  }
}
