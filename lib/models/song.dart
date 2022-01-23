class Song {
  final String songName;
  final String artist;
  final String image;
  final int id;
  final String audio;

  Song({
    required this.id,
    required this.songName,
    required this.image,
    required this.artist,
    required this.audio,
  });
}

List<Song> song = [
  Song(
      id: 1,
      songName: 'When im Gone',
      image: "images/when.jpg",
      artist: 'Alesso & Katy Perry',
      audio: 'assets/sound/When.mp3'),
  Song(
      id: 2,
      songName: 'Riddim-5',
      image: "images/Fave.jpeg",
      artist: 'Fave',
      audio: 'assets/sound/Obsessed.mp3'),
  Song(
      id: 3,
      songName: 'Easy on me ',
      image: "images/Adele.jpeg",
      artist: 'Adele',
      audio: 'assets/sound/Adele.mp3'),
  Song(
      id: 4,
      songName: 'Loved By You ',
      image: "images/justin.jpg",
      artist: 'Justin Bieber',
      audio: 'assets/sound/Justin.mp3')
];
