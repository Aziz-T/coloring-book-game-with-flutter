import 'package:colorgame/pages/image_list_page/image_grid_list_page.dart';
import 'package:colorgame/providers/main_provider.dart';
import 'package:colorgame/widgets/image_menu_item/image_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageMenuItem(
            title: "Animals",
            imageList: context.read<MainProvider>().animalList,
            asset: "animals",
            navigatePage: ImageGridListPage(dataList: context.read<MainProvider>().animalList, asset: "animals",),
          ),
          ImageMenuItem(
            title: "Flowers",
            imageList: context.read<MainProvider>().flowersList,
            asset: "flowers",
            navigatePage: ImageGridListPage(dataList: context.read<MainProvider>().flowersList, asset: "flowers",),
          ),
          ImageMenuItem(
            title: "Images",
            imageList: context.read<MainProvider>().mattersList,
            asset: "matters",
            navigatePage: ImageGridListPage(dataList: context.read<MainProvider>().mattersList, asset: "matters",),
          ),
          ImageMenuItem(
            title: "Plants",
            imageList: context.read<MainProvider>().plantsList,
            asset: "plants",
            navigatePage: ImageGridListPage(dataList: context.read<MainProvider>().plantsList,asset: "plants",),
          )
        ],
      ),
    );
  }
}
