import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/main_provider.dart';
import '../../../widgets/image_grid_item/image_grid_item.dart';

class SavedImagePage extends StatefulWidget {
  const SavedImagePage({Key? key}) : super(key: key);

  @override
  State<SavedImagePage> createState() => _SavedImagePageState();
}

class _SavedImagePageState extends State<SavedImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(builder: (context, snapshot, child) {
        return snapshot.savedImageList.length == 0
            ? Center(
              child: Text(
                  "You have not colored yet!",
                  style: TextStyle(fontFamily: 'McLaren'),
                ),
            )
            : GridView.count(
                crossAxisCount: 2,
                children:
                    List.generate(snapshot.savedImageList.length, (index) {
                  return Center(
                    child: ImageGridItem(
                      file: snapshot.savedImageList[index].pathToFile(),
                      index: index,
                    ),
                  );
                }));
      }),

      // Center(
      //   child: Image.file(context.read<MainProvider>().savedImageList[0]),
      // ),
    );
  }
}
