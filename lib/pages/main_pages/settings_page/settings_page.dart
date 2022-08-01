import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TextButton(
          //   onPressed: () {},
          //   child: Text("Share App",style: TextStyle(fontFamily: 'McLaren'),),
          // ),
        ],
      ),
    );
  }
}
