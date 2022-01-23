import 'package:applemusic/models/song.dart';
import 'package:applemusic/screen/search_screen.dart';
import 'package:applemusic/screen/song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenStats createState() => HomeScreenStats();
}

class HomeScreenStats extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Mucis Demo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Most Popular",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "playList",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                Container(
                  height: 300,
                  child: TrackWidget(),
                ),
                CircleTrackWidget(
                  title: "New",
                  subtitle: "3452 songs",
                  songName: song,
                ),
                CircleTrackWidget(
                  title: "Your Playlist",
                  subtitle: "332 songs",
                  songName: song,
                ),
                SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter, child: PlayerHome(currentSong))
        ],
      ),
    );
  }
}

Song currentSong = Song(
    songName: "When im Gone",
    artist: "Alesso & Katy Perry",
    image: "images/when.jpg",
    id: 1,
    audio: 'assets/sound/When.mp3');

class PlayerHome extends StatelessWidget {
  final Song song;

  PlayerHome(this.song);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SongScreen(currentSong)),
        );
      },
      child: Container(
        height: 130,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(song.image),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.songName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          song.artist,
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.skip_previous_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.skip_next_outlined,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: song.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white, blurRadius: 1, spreadRadius: 0.3)
                ],
                image: DecorationImage(
                    image: AssetImage(song[index].image), fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song[index].songName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(song[index].artist,
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        });
  }
}

class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> songName;
  final String subtitle;

  CircleTrackWidget(
      {required this.title, required this.songName, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            subtitle,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Container(
            height: 120,
            child: ListView.builder(
              itemCount: song.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(song[index].image),
                        radius: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        song[index].songName,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        song[index].artist,
                        style: TextStyle(color: Colors.white54),
                      )
                    ],
                  ),
                );
              },
            ))
      ]),
    );
  }
}
