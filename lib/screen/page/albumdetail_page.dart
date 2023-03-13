import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/logger.dart';
import '../page/practice_three.dart';

class AlbumDetailsPage extends StatefulWidget {
  final String albumName;
  final String artistName;
  final String imageUrl;

  AlbumDetailsPage({required this.albumName, required this.artistName, required this.imageUrl});

  @override
  _AlbumDetailsPageState createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<AlbumDetailsPage> {
  Duration _duration = Duration();//sliderで使う
  Duration _position = Duration();
  late AudioPlayer _audioPlayer;
  
  
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    super.dispose();
  }

  void play() async {
    await _audioPlayer.play('//指定なし');
    setState(() {
      isPlaying = true;
    });
  }

  void pause() async {
    if (_audioPlayer != null) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.imageUrl,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            '${widget.albumName}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            '${widget.artistName}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 16,
          ),
          Slider(
            value: _position.inSeconds.toDouble(), //現在のスライダー位置
            min: 0.0, //最小値
            max: _duration.inSeconds.toDouble(), //最大値
            onChanged: (double value) { //スライダーをドラッグした時に呼び出す
              setState(() {
                 _position = Duration(seconds: value.toInt());
                 _audioPlayer.seek(Duration(seconds: value.toInt()));
               });
             },
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                    '${(_duration.inMinutes % 60).toString().padLeft(1, '5')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon( 
                Icons.skip_previous,
                color: Colors.white,
              ),
              SizedBox(width: 32),
              if (!isPlaying)
                IconButton(
                  onPressed: () => play(),
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                  ),
                  iconSize:50,
                ),
              if (isPlaying)
                IconButton(
                  onPressed: () => pause(),
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.pause,
                      color: Colors.black,
                    ),
                  ),
                  iconSize:50,
                ),
                SizedBox(width: 32),
                Icon( 
                  Icons.skip_next,
                  color: Colors.white,
                ),
            ],
          ),
          SizedBox(width: 32),
        ],
      ),
    );
  }
}
