class Playlist{
  late final String thumbnail;
  late final String musicName;
  late final String musicURL;

  Playlist({required this.thumbnail, required this.musicName, required this.musicURL});

  Playlist.fromJson(Map<String, dynamic> json) {
    thumbnail = json['imageLink'];
    musicName = json['name'];
    musicURL = json['link'];
  }
}