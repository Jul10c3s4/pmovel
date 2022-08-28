import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1E1040),
        title: Text(
          'Sobre o Memstudy',
          style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/config');
          },
          icon: Icon(
            Icons.close,
            size: 45,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Row(
                  children: [
                    Text('Data de criação: ',
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                    Text(
                      '24/08/2022',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'O que é o MemStudy?',
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'O MemStudy é uma ferramenta de aprendizado criada com o intuito de ajudar pessoas '
                            'com dificuldades de estudar matérias comuns do dia dia,'
                            ' nele é possível realizar estudos da maneira mais dinâmica possível'
                            ', pois temos diversas maneiras de possibilitar formas de estudos para você,'
                            'desde cards prontos com o assunto já sintetizado para você entender de'
                            ' maneira prática e direta os conteúdos, à jogos diversificados nos quais possibilitam'
                            ' a revisão dos conteúdos, vale ressaltar que possibilitamos também em nossa ferramenta a criação'
                            ' de cards cujo você usuário poderá colocar o conteúdo aprendido por você da maneira que quiser',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 40,)
                    ],
                  ),

                )



              ],
            )
          ],
        ),
      ),
    );
  }
}
