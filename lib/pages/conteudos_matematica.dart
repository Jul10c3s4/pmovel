import 'package:flutter/material.dart';

class ConteudosGeometriaAnalitica extends StatefulWidget {
  final VoidCallback onPressed;
  final String nomeBotoes;

  const ConteudosGeometriaAnalitica({
    Key? key,
    required this.onPressed,
    required this.nomeBotoes,
  }) : super(key: key);

  @override
  _ConteudosGeometriaAnalitica createState() => _ConteudosGeometriaAnalitica();
}

class _ConteudosGeometriaAnalitica extends State<ConteudosGeometriaAnalitica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF180C36),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: widget.onPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '${widget.nomeBotoes}',
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: onPressed4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Voltar"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed1(){

  }

  void onPressed2(){

  }

  void onPressed3(){

  }

  void onPressed4() {
    Navigator.pop(context);
  }
}
