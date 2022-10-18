import 'package:app/domain/container.dart';
import 'package:app/pages/login.dart';
import 'package:app/widgets/opcao_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TelaConfig extends StatefulWidget {
  const TelaConfig({Key? key}) : super(key: key);

  @override
  State<TelaConfig> createState() => _TelaConfigState();
}

class _TelaConfigState extends State<TelaConfig> {
  late final Login login;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  Conteudo conte1 = Conteudo(titulo: "Central de ajuda", rota: '/homepage');
  Conteudo conte2 = Conteudo(titulo: "Sobre o Memstudy", rota: '/homepage');
  Conteudo conte3 = Conteudo(titulo: "Versão", rota: '/homepage');
  Conteudo conte4 = Conteudo(titulo: "Avalie-nos", rota: '/homepage');
  Conteudo conte5 = Conteudo(titulo: "Termos de uso", rota: '/homepage');
  Conteudo conte6 = Conteudo(titulo: "Sair", rota: '/homepage');



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1040),
        centerTitle: true,
        title: Text(
          'Configurações',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.grey.shade800,
            size: 45,
          ),
        ),
      ),
      backgroundColor: Color(0xFF6D39E6),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        child: Container(
                            child: Image.asset(
                          'images/cereDuvidas.png',
                          fit: BoxFit.contain,
                        )),
                      ),
                    ]),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(color: Color(0xFF5B30BF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Tipo de conta',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Gratuita',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Adquirir versão pro',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Color(0xFF3D2080),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8)),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(color: Color(0xFF5B30BF)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Configurações do usuário',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(children: [
                            Text(
                              'E-mail',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                'usuario@gmail.com',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(children: [
                            Text(
                              'Nome do usuário',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                'usuario',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(children: [
                            Text(
                              'Alterar Senha',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                '********',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte1),
                      SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(color: Color(0xFF5B30BF)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Configurações gerais',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Efeitos sonoros',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Switch(
                                    value: isSwitched1,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched1 = value;
                                      });
                                    })
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Modo escuro',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Switch(
                                    value: isSwitched2,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched2 = value;
                                      });
                                    })
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notificações',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Switch(
                                    value: isSwitched3,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched3 = value;
                                      });
                                    })
                              ]),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte2),
                    SizedBox(
                      height: 6,
                    ),
                   
                   Opcao_config(cont: conte3),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte4),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte5),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte6)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  doContainer(String titulo, dynamic page) {
    Container(
      decoration: BoxDecoration(color: Color(0xFF5B30BF)),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return page();
          }));
        },
        child: Text(
          '$titulo',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
    return Container();
  }
}
