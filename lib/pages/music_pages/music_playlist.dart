import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JsonMusic extends StatefulWidget {
  final List musicJSONsObjects;

  const JsonMusic({Key? key, required this.musicJSONsObjects}) : super(key: key);
  @override
  _JsonMusic createState() => _JsonMusic();
}

class _JsonMusic extends State <JsonMusic> {
  @override

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
      backgroundColor: const Color(0xFF9F9F9F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F4F4F),
        title: buildText(text: "Playlist"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        border: Border.all(color: Color(0xFF000000)),
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(widget.musicJSONsObjects[index].thumbnail),
                              child: const Text(""),
                            ),
                          ),
                          buildText(text: widget.musicJSONsObjects[index].musicName),
                          ElevatedButton(
                            onPressed: () => onPressed(musicLink: widget.musicJSONsObjects[index].musicURL),
                            child: Icon(
                              Icons.play_arrow,
                              size: 44,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: const Color(0xFF4F4F4F),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: widget.musicJSONsObjects.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildText({required String text}){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  onPressed({required String musicLink}){
    launchUrlMusic(urlString: musicLink);
  }

}