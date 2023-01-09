import 'dart:convert';

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

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumbnail'] = thumbnail;
    data['musicName'] = musicName;
    data['musicURL'] = musicURL;
    return data;
  }

}