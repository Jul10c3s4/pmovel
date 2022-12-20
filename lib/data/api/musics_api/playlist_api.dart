import 'dart:convert';
import 'package:app/domain/musics_domain/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PlaylistAPI {

  final String baseURL = "musicappapi.fhyvugvfjudgf.repl.co";
  //List <Playlist> playlistContents = <Playlist> [];

  Future<List<Playlist>> listDatas() async {
    Uri url = Uri.http(baseURL, "/resgatarMusicas");
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

  Future<void> insertMusicDatas({required String musicName, required String url, required String thumbnail}) async {

    Playlist play = Playlist(thumbnail: thumbnail, musicName: musicName, musicURL: url);
    dynamic playJson = play.toJson();

    Uri uri = Uri.http(baseURL, "/cadastrarMusica/$musicName/$url/$thumbnail");
    Response response = await http.get(uri);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {

    }
  }

  Future<void> atualizarMusica({required String oldText, required String newText, required String type}) async {

    Uri url;
    if (type == "nome") {
      url = Uri.http(baseURL, "/atualizarNomeMusica/$oldText/$newText");
    } else {
      if (type == "url") {
        url = Uri.http(baseURL, "/atualizarLinkMusica/$oldText/$newText");
      } else {
        url = Uri.http(baseURL, "/atualizarThumbMusica/$oldText/$newText");
      }
    }

    Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {

    }
  }

  Future<void> deleteMusicRow({required String musicName}) async {
    Uri url = Uri.http(baseURL, "/deletarMusica/$musicName/");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {

    }
  }
}

/*
//Cach
//https://youtu.be/loa_IxjUBKo?list=RDMMYRhX73YD0Uo
//https://thumbs.dreamstime.com/b/muito-dinheiro-2153680.jpg
//https://www.aprendadatascience.com/blog/python-e-spotify-buscando-%C3%A1lbuns-e-m%C3%BAsicas
*/
