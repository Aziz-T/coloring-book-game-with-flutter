import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:colorgame/main.dart';
import 'package:colorgame/pages/home_page/home_page.dart';
import 'package:colorgame/providers/main_provider.dart';
import 'package:colorgame/widgets/my_app_bar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance?.addPostFrameCallback((_){

      context.read<MainProvider>().loadData();

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            HomePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent
          ),
          // BottomNavyBarItem(
          //     icon: Icon(Icons.message),
          //     title: Text('Messages'),
          //     activeColor: Colors.pink
          // ),
          // BottomNavyBarItem(
          //     icon: Icon(Icons.settings),
          //     title: Text('Settings'),
          //     activeColor: Colors.blue
          // ),
        ],
      ),
    );
  }
}
