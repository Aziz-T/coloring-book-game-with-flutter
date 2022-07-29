import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? buttonText;
  final Function()? onPressed;
  final double? fontSize;
  const MyAppBar({Key? key, this.title, this.onPressed, this.fontSize, this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "App",
        style: TextStyle(fontFamily: 'McLaren', fontSize: fontSize ?? 18),
      ),
      elevation: 0,
      actions: onPressed == null
          ? null
          : [
        TextButton(
          onPressed: onPressed,
          child: Text( buttonText??"Save",
              style: TextStyle(fontFamily: 'McLaren', fontSize: 18, color: Colors.black)),
        )
      ],
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(0, 56);
}
