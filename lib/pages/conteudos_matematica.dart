import 'package:flutter/material.dart';

class ConteudosGeometriaAnalitica extends StatefulWidget{
  const ConteudosGeometriaAnalitica({Key? key}) : super(key: key);

  @override
  _conteudosGeometriaAnalitica createState() => _conteudosGeometriaAnalitica();
}

class _conteudosGeometriaAnalitica extends State<ConteudosGeometriaAnalitica> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF180C36),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Definição: A GEOMETRIA ANALÍTICA É O CAMPO DA MATETÁMATICA QUE ESTUDA A ARETMÉTICA DOS GRÁFICOS, ISTO É,'
                            'A QUANTIFICAÇÃO DAS OPERAÇÕES FEITAS NO PLANO CARTESIANO.',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                        ),
                      ),
                      ElevatedButton(
                          onPressed: onPressed,
                          child: const Text("Voltar"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void onPressed(){
    Navigator.pop(context);
  }
}
