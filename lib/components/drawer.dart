import 'package:flutter/material.dart';
import 'package:music_app/routes/routenames.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 25,
            ),
            onTap: () {
              Navigator.pushNamed(context, Routenames.home);
            },
            title: Text(
              'Home',
              style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
            ),
            onTap: () {
              Navigator.pushNamed(context, Routenames.setting);
            },
            title: Text(
              'Setting',
              style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
