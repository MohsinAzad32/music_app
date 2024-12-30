import 'package:flutter/material.dart';
import 'package:music_app/components/neubox.dart';
import 'package:music_app/provider/playlistprovider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  String formattime(Duration duration) {
    String twodigitseconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedtime = "${duration.inMinutes}:$twodigitseconds";
    return formattedtime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Playlistprovider>(
      builder: (context, value, child) {
        final playlist = value.playlist;

        final song = playlist[value.index ?? 0];
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Text('P L A Y L I S T'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Neubox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          child: Image.asset(
                            song.coverimage,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  song.songname,
                                  style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  song.artistName,
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formattime(value.currentDuration)),
                            Icon(Icons.shuffle),
                            Icon(Icons.repeat),
                            Text(formattime(value.totalDuration)),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 0,
                          ),
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          onChanged: (value) {},
                          onChangeEnd: (double) {
                            value.seek(
                              Duration(
                                seconds: double.toInt(),
                              ),
                            );
                          },
                          value: value.currentDuration.inSeconds.toDouble(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playPreviousSong,
                                child: Neubox(
                                  child: Icon(
                                    Icons.skip_previous,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: value.pauseorResume,
                                child: Neubox(
                                  child: Icon(
                                    value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playnextsong,
                                child: Neubox(
                                  child: Icon(
                                    Icons.skip_next,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
