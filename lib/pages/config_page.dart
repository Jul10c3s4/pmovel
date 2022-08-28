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

  Conteudo conte1 =
      Conteudo(titulo: "Central de ajuda", rota: '/central-ajuda');
  Conteudo conte2 = Conteudo(titulo: "Sobre o Memstudy", rota: '/sobre');
  Conteudo conte3 = Conteudo(titulo: "Avalie-nos", rota: '/avalie-nos');
  Conteudo conte4 = Conteudo(titulo: "Termos de uso", rota: '/termos_uso');
  Conteudo conte5 = Conteudo(titulo: "Sair", rota: '/login');

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
                      SizedBox(
                      height: 6,
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
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Insira a senha:',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      content: TextField(),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Insira insira o novo Email:',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                  content: TextField(),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Continuar',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .lightBlueAccent,
                                                        primary: Colors.white,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Cancelar',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.redAccent,
                                                        primary: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Continuar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            primary: Colors.white,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancelar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                            primary: Colors.white,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Alterar e-mail',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Insira a senha:',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      content: TextField(),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Insira o novo nome de usuário:',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                  content: TextField(),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Continuar',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .lightBlueAccent,
                                                        primary: Colors.white,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Cancelar',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.redAccent,
                                                        primary: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Continuar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            primary: Colors.white,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancelar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                            primary: Colors.white,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Alterar nome do usuário',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Insira a senha:',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      content: TextField(),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Insira a nova senha:',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                  content: TextField(),
                                                  actions: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Confirme a nova senha:',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        child: Container(
                                                          child: TextField(),
                                                        )),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Ok',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor: Colors
                                                                .lightBlueAccent,
                                                            primary:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancelar',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .redAccent,
                                                            primary:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Continuar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            primary: Colors.white,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancelar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                            primary: Colors.white,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Alterar Senha',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
                                        if (isSwitched2 == true) {
                                          print('oi');
                                          MaterialApp(
                                            darkTheme: ThemeData.dark(),
                                          );
                                        }
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(color: Color(0xFF5B30BF)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                            'Versão',
                            style: TextStyle(
                                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text('versão 1',
                              style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              ),)
                            ],
                          )
                        ]),
                        
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Opcao_config(cont: conte5),
                    SizedBox(
                      height: 6,
                    ),
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
  }
}
