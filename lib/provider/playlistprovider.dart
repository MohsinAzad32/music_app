// import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/songs.dart';

class Playlistprovider extends ChangeNotifier {
  final List<Songs> _allsongs = [
    Songs(
      artistName: 'Arijit Sing',
      audiopath: 'audio/sajni.mp3',
      coverimage: 'assets/images/sajni.jpg',
      songname: 'oo Sajni Re',
    ),
    Songs(
      artistName: 'Anuv jain',
      audiopath: 'audio/mere.mp3',
      coverimage: 'assets/images/mere.jpg',
      songname: 'Jo Tum Mere ho',
    ),
    Songs(
      artistName: 'Atif Aslam',
      audiopath: 'audio/pehli.mp3',
      coverimage: 'assets/images/pehli.jpg',
      songname: 'Pehli Dafa',
    ),
  ];

  int? _currentsongindex;
  // get playlist of songs
  List<Songs> get playlist => _allsongs;
  int? get index => _currentsongindex;
  bool get isPlaying => _isplaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentindex(int? newindex) {
    _currentsongindex = newindex;

    if (newindex != null) {
      play();
    }
    notifyListeners();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isplaying = false;

// play song
  void play() async {
    final path = playlist[_currentsongindex!].audiopath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isplaying = true;
    notifyListeners();
  }

  //pause song
  void pause() async {
    await _audioPlayer.stop();
    _isplaying = false;
    notifyListeners();
  }
  //resume song

  void resume() async {
    await _audioPlayer.resume();
    _isplaying = true;
    notifyListeners();
  }

  //resume or pause song

  void pauseorResume() async {
    if (_isplaying) {
      pause();
    } else {
      play();
    }
    notifyListeners();
  }

  //seek specific position in song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song

  void playnextsong() {
    if (_currentsongindex != null) {
      if (_currentsongindex! < playlist.length - 1) {
        currentindex = _currentsongindex! + 1;
      } else {
        currentindex = 0;
      }
    }
  }

  //play previous song

  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      // seek(Duration.zero);
    } else {
      if (_currentsongindex! > 0) {
        currentindex = _currentsongindex! - 1;
      } else {
        currentindex = playlist.length - 1;
      }
    }
  }

  Playlistprovider() {
    listentoDuration();
  }

  void listentoDuration() {
    //listen for total Duration
    _audioPlayer.onDurationChanged.listen(
      (newDuration) {
        _totalDuration = newDuration;
        notifyListeners();
      },
    );

    //listen for current duration
    _audioPlayer.onPositionChanged.listen(
      (newDuration) {
        _currentDuration = newDuration;
        notifyListeners();
      },
    );

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen(
      (event) {},
    );
  }
}
