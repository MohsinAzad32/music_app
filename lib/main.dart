import 'package:flutter/material.dart';
import 'package:music_app/provider/playlistprovider.dart';
import 'package:music_app/routes/routenames.dart';
import 'package:music_app/routes/routes.dart';
import 'package:music_app/view/home.dart';
import 'package:music_app/provider/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Themeprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Playlistprovider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routenames.home,
      onGenerateRoute: Routes.generateroutes,
      theme: Provider.of<Themeprovider>(context).themedata,
      home: HomeScreen(),
    );
  }
}
