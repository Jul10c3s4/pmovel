import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenrePage extends StatefulWidget {
  final List musicGenreList;

  GenrePage({
    Key? key,
    required this.musicGenreList,
  }) : super(key: key);
  @override
  _GenrePage createState() => _GenrePage();
}

class _GenrePage extends State <GenrePage> {
  @override

  Widget build(BuildContext context){
    List list = widget.musicGenreList;
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Text(
              list[index].musicName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            );
          },
        itemCount: list.length,
      ),
    );
  }
}
