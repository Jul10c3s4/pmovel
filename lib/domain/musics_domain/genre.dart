class MusicGenre{
  late final String genreName;
  late final String musicName;
  late final String musicSinger;
  late final String wallpaperLink;
  late final String youtubeURL;

  MusicGenre({
    required this.genreName, required this.musicName, required this.musicSinger, required this.wallpaperLink, required this.youtubeURL
  });

  MusicGenre.fromJson(Map<String, dynamic> json){
    genreName = json['genreName'];
    musicName = json['musicName'];
    musicSinger = json['musicSinger'];
    wallpaperLink = json['linkMusicWallpaper'];
    youtubeURL = json['youtubeURL'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genreName'] = genreName;
    data['musicName'] = musicName;
    data['musicSinger'] = musicSinger;
    data['linkMusicWallpaper'] = wallpaperLink;
    data['youtubeURL'] = youtubeURL;
    return data;
  }

}
