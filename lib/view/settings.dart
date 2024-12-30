import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/provider/themeprovider.dart';

import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Consumer<Themeprovider>(
                  builder: (context, value, child) {
                    return CupertinoSwitch(
                      value: value.isDarkMode,
                      onChanged: (val) {
                        value.toggletheme();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
