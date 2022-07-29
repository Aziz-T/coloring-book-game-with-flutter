import 'package:colorgame/values/icons/eraser_icon_icons.dart';
import 'package:colorgame/widgets/palette_widget/palette_item.dart';
import 'package:floodfill_image/floodfill_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ImageColorPage extends StatefulWidget {
  final String? title;
  final String path;
  const ImageColorPage({Key? key, this.title, required this.path}) : super(key: key);

  @override
  _ImageColorPageState createState() => _ImageColorPageState();
}

class _ImageColorPageState extends State<ImageColorPage> {
  Color _fillColor = Colors.white;
  Color _colorize = Colors.white;
  int index = 0;
  double h = 600;
  double w = 600;
  // create some values
  Color pickerColor = Color(0xffffffff);
  double _currentSliderValue = 20;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() {
                 _fillColor = pickerColor;
                 _colorize = pickerColor;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: MyAppBar(
        //   title: "Color",
        // ),
        body: Column(
          children: <Widget>[
            buildRow(),
            Container(
              width: w,
              height: h,
              child: Zoom(
                maxZoomHeight: 600,
                maxZoomWidth: 600,
                initZoom: 0,
                child: FloodFillImage(
                  imageProvider: AssetImage(
                      widget.path),
                  fillColor: _fillColor,
                  avoidColor: [Colors.transparent, Colors.black],
                  tolerance: 19,
                ),
              ),
            ),
            Spacer(),
            buildSingleChildScrollView()
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.white;
              });
            },
            color: Colors.white,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.red;
              });
            },
            color: Colors.red,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.green;
              });
            },
            color: Colors.green,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.blue;
              });
            },
            color: Colors.blue,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.yellow;
              });
            },
            color: Colors.yellow,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.pink;
              });
            },
            color: Colors.pink,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.purple;
              });
            },
            color: Colors.purple,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.brown;
              });
            },
            color: Colors.brown,
          ),
          PaletteItem(
            onTap: () {
              setState(() {
                _fillColor = Colors.orange;
              });
            },
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                _fillColor = Colors.white;
              });
            },
            icon: Icon(EraserIcon.icon_eraser)),
        Spacer(),
        PaletteItem(
          color: _colorize,
        ),
        IconButton(
            onPressed: () {
              _showMyDialog();
            },
            icon: Icon(
              Icons.colorize,
              color: Colors.black,
              size: 25,
            )),
        // IconButton(
        //     onPressed: () {
        //       setState(() {
        //         h -= 50;
        //         w -= 50;
        //       });
        //     },
        //     icon: Icon(Icons.zoom_out, color: Colors.blue)),
      ],
    );
  }
}
