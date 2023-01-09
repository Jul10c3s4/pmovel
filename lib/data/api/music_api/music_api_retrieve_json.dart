import 'dart:convert';
import 'package:app/domain/music_domain/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PlaylistAPI {

  final String baseURL = "musicappapi.fhyvugvfjudgf.repl.co";

  Future<List<Playlist>> listDatas() async {

    Uri url = Uri.http(baseURL, "/resgatarJSON");
    Response response = await http.get(url);
    List <Playlist> playlistContents = <Playlist> [];

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("$result \n");

      for (var json in result) {
        Playlist play = Playlist.fromJson(json);
        playlistContents.add(play);
      }
      print("$playlistContents \n");
    }

    return playlistContents;
  }
}
