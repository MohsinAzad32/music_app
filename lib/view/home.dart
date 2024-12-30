import 'package:flutter/material.dart';
import 'package:music_app/components/drawer.dart';
import 'package:music_app/models/songs.dart';
import 'package:music_app/provider/playlistprovider.dart';
import 'package:music_app/routes/routenames.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Playlistprovider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<Playlistprovider>(context, listen: false);
  }

  void gotoSong(int songindex) {
    provider.currentindex = songindex;

    Navigator.pushNamed(
      context,
      Routenames.song,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: Consumer<Playlistprovider>(
        builder: (context, value, child) {
          List<Songs> playlist = value.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final song = playlist[index];

              return ListTile(
                leading: Image.asset(song.coverimage),
                onTap: () {
                  gotoSong(index);
                },
                title: Text(
                  song.songname,
                ),
                subtitle: Text(song.artistName),
              );
            },
          );
        },
      ),
    );
  }
}
