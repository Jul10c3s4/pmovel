import 'package:app/data/api/music_api/playlist_api.dart';
import 'package:app/domain/music_domain/playlist.dart';
import 'package:app/pages/music_pages/music_playlist.dart';
import 'package:app/widgets/music_widgets/genre_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app/data/music_data/data_request.dart';
import 'package:app/domain/music_domain/music.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMusic extends StatefulWidget {
  const HomeMusic({Key? key}) : super(key: key);
  @override
  _HomeMusic createState() => _HomeMusic();
}

class _HomeMusic extends State <HomeMusic> {
  @override
  Future<List<Music>> musicList = DataRequest().buildDatabase();
  Future<List> musicGenreList = DataRequest().retrieveGenreDatas();
  Future<List<Playlist>> musicJSONS = PlaylistAPI().listDatas();

  Future<void> launchUrlMusic({required String urlString}) async{
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6E39F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF180C36),
        title: returnText(text: "Study Musics", size: 24, color: Colors.white),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder <List>(
            future: musicGenreList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List presentMusicGenreList = snapshot.data ?? [];
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 64,
                    child: Row(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 16);
                          },
                          itemBuilder: (context, index) {
                            List lista = presentMusicGenreList[index];
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  returnElevatedButton(list: lista, genreName: lista[0].genreName, size: 18, color: Color(0xFF000000))
                                ],
                              ),
                            );
                          },
                          itemCount: presentMusicGenreList.length,
                        ),
                        FutureBuilder<List>(
                          future: musicJSONS,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List playlistJSON = snapshot.data ?? [];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => onPressedJSON(musicsJSON: playlistJSON),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFFEEEEEE),
                                  ),
                                  child: returnText(text: "Playlist", size: 18, color: Color(0xFF000000)),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0,3.0,18.0,18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      border: Border.all(color:  const Color(0xFF000000)),
                      borderRadius: BorderRadiusDirectional.circular(12),
                    ),
                    width: MediaQuery.of(context).size.width - 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        returnIcon(icon: Icons.book, size: 50),
                        returnIcon(icon: Icons.play_arrow, size: 50),
                        returnIcon(icon: Icons.pause_circle, size: 50),
                      ],
                    ),
                  ),
                ),
                FutureBuilder <List<Music>>(
                  future: musicList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Music> musics = snapshot.data ?? [];
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: musics.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 36);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFF180C36),
                            ),
                            height: 460,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 260,
                                  child: AspectRatio(
                                    aspectRatio: 4/3,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(musics[index].imageLink),
                                      child: const Text(""),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    child: Container(
                                      height: 95,
                                      width: MediaQuery.of(context).size.width - 16,
                                      color: const Color(0xFFEEEEEE), //aqui
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          returnIcon(icon: Icons.music_note, size: 50),
                                          returnText(text: musics[index].name, size: 36, color: const Color(0xFF000000)), //pasar a cor preta
                                        ],
                                      ),
                                    ),
                                    onTap: () => launchUrlMusic(urlString: musics[index].link),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),

          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF180C36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                returnText(text: "Enjoy Your Study Music!", size: 23, color: const Color(0xFFEEEEEE)),
                returnText(text: "Copyright Ⓒ2022, All Rights Reserved.", size: 14, color: const Color(0xFFEEEEEE)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  returnText({required String text, required double size, required Color color}){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }

  returnIcon({required IconData icon, required double size}){
    return Icon(
      icon,
      size: size,
    );
  }

  returnElevatedButton({required List list, required String genreName, required double size, required Color color}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFEEEEEE),
      ),
      child: returnText(text: genreName, size: size, color: Color(0xFF000000)),
      onPressed: () => onPressed(genreList: list),
    );
  }

  onPressed({
    required List genreList,
  }){
    Navigator.push(context,
      MaterialPageRoute(
          builder: (context) {
            return GenrePage(musicGenreList: genreList);
          }
      ),
    );
  }

  onPressed1(){}

  onPressedJSON({required List musicsJSON}){
    Navigator.push(context,
      MaterialPageRoute(
          builder: (context) {
            return JsonMusic(musicJSONsObjects: musicsJSON);
          }
      ),
    );
  }
}