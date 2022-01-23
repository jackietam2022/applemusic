import 'package:applemusic/models/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

class SongScreen extends StatefulWidget {
  final Song song;

  SongScreen(this.song);

  @override
  SongScreenState createState() => SongScreenState(song);
}

class SongScreenState extends State<SongScreen> {
  final Song song;

  SongScreenState(this.song);

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  onPressed() async {
    await player.setAsset(song.audio);
    setState(() {
      player.playing;
    });
    if (!player.playing) {
      player.play();
    } else {
      player.stop();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text(
            'Now Playing',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
          ),
          actions: [
            Icon(
              Icons.more_horiz,
              color: Colors.grey,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(song.image),
                          fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      song.songName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    song.artist,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  value: 0.4,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      '04:30',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '06:30',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.playlist_add,
                              size: 35,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous,
                              size: 35,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                              player.playing ? Icons.pause : Icons.play_arrow,
                              size: 35,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next,
                              size: 35,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shuffle,
                              size: 35,
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}
