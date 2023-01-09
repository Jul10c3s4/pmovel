import 'package:app/data/cartaoDao.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/pages/principal/destaque_page.dart';
import 'package:flutter/material.dart';
import 'package:app/data/atributosDao.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewCard extends StatefulWidget {
  final CartaoResumo? cartaoResumo;
  const NewCard({Key? key, this.cartaoResumo}) : super(key: key);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  TextEditingController tituloController = new TextEditingController();
  TextEditingController descricaoController = new TextEditingController();
  //TextEditingController materiaController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String nomeMateria = "";
  var _materias = [
    'PORTUGUÊS',
    'GEOGRAFIA',
    'HISTÓRIA',
    'Biologia',
    'Física',
    'MATEMÁTICA',
    'LÓGICA DE PROGRAMAÇÃO'
  ];
  String _itemSelecionado = "";
  String TituloPage = "NOVO CARD";
  String TituloButton = "CRIAR";
  late CartaoResumo edited_CartaoResumo;
  String search = "";
  String erro = "";
  int quantImages = 20;
  String imagem = "";
  TextEditingController texto = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.cartaoResumo == null) {
      edited_CartaoResumo = CartaoResumo.nada();
      _itemSelecionado = 'HISTÓRIA';
    } else {
      TituloPage = "ATUALIZAR CARD";
      TituloButton = "ATUALIZAR";
      edited_CartaoResumo = widget.cartaoResumo!;
      tituloController.text = widget.cartaoResumo!.titulo.toString();
      descricaoController.text = widget.cartaoResumo!.descricao.toString();
      _itemSelecionado = widget.cartaoResumo!.materia.toString();
      imagem = widget.cartaoResumo!.imagem.toString();
      search = widget.cartaoResumo!.titulo.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff180c36),
        ),
        backgroundColor: const Color(0xffa08ad7),
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white10,
            ),
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.maxFinite,
                        alignment: AlignmentDirectional.center,
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(TituloPage, style: TextStyle(fontSize: 25)),
                      ),

                      TextFormField(
                        controller: tituloController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                          border: UnderlineInputBorder(),
                          prefixIconColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo e-mail obrigatório';
                          }
                          return null;
                        },
                        onFieldSubmitted: (texto) {
                          search = texto;
                        },
                        onChanged: (texto) {
                          search = texto;
                        },
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'MATÉRIA:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                              alignment: AlignmentDirectional.center,
                              focusColor: Colors.white30,
                              items: _materias.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (String? novoItemSelecionado) {
                                dropDownItemSelected(novoItemSelecionado!);
                                setState(() {
                                  _itemSelecionado = novoItemSelecionado;
                                });
                              },
                              value: _itemSelecionado),
                        ],
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Descrição',
                        ),
                        controller: descricaoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      //inputar link externo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              BuildBottomlSheet(context);
                            },
                            child: Text(
                              "Escolher imagem",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: GestureDetector(
                              child: Image.network(
                                imagem.isEmpty
                                    ? imagem ="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
                                    : imagem.toString(),
                                fit: BoxFit.contain,
                                width: 140,
                                height: 140,
                              ),
                              onTap: () {
                                BuildBottomlSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 10),
                              primary: Colors.white,
                              backgroundColor: const Color(0xff180c36),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              '$TituloButton',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void onPressed() async {
    if (_formKey.currentState!.validate()) {
      String tituloDigitado = tituloController.text;
      String materiaDigitada = _itemSelecionado;
      String DescricaoDigitada = descricaoController.text;

      if (imagem ==
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png") {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                clipBehavior: Clip.none,
                title: Text(
                  "Erro de validação",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                content: Text("Escolha uma imagem para criar o card!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ok", style: TextStyle(color: 
                    Colors.white),),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  )
                ],
              );
            });
          }else{
        if (edited_CartaoResumo == widget.cartaoResumo) {
          CartaoResumo cardResumo = CartaoResumo(
              materia: materiaDigitada,
              titulo: tituloDigitado,
              descricao: DescricaoDigitada,
              imagem: imagem.toString());

          await CartaoDao().AtualizarCartao(cartaoResumo: cardResumo);

          Navigator.pop(context, cardResumo);
        } else {
          CartaoResumo cartaoResumo = CartaoResumo(
              materia: materiaDigitada,
              titulo: tituloDigitado,
              descricao: DescricaoDigitada,
              imagem: imagem);
          await CartaoDao().salvarCartaoResumo(cartaoResumo: cartaoResumo);

          showSnackBar('Novo cartão foi salvo com sucesso!');

          Navigator.pop(context);
        }
      } 
    }
  }

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  dropDownItemSelected(String novoItem) {
    setState(() {
      _itemSelecionado = novoItem;
    });
  }

  BuildBottomlSheet(BuildContext) {
    showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        context: context,
        builder: (context) {
          return BottomSheet(
            elevation: 20,
            backgroundColor: Colors.purple.shade100,
            onClosing: () {},
            builder: (context) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      onChanged: (value) {
                        search = value;
                      },
                      controller: texto,
                      decoration: InputDecoration(
                        labelText: "Insira o tópico",
                        hintText: "Exemplo: citologia",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                search = texto.text;
                                Navigator.pop(context);
                                BuildBottomlSheet(context);
                                quantImages = 20;
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder(
                        future: getImages(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 182, 81, 200)),
                                      strokeWidth: 5,
                                    ),
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.purpleAccent,
                                        ),
                                        child: Text(
                                          "houve um  erro: ${snapshot.error}",
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return BuildGridView(context, snapshot);
                              }
                          }
                        }),
                  )
                ],
              );
            },
          );
        });
  }

  Widget BuildGridView(BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
          itemCount: _getCount(snapshot.data!['photos']),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 3,
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              mainAxisSpacing: 3),
          itemBuilder: (context, index) {
            if (search.isEmpty || index < snapshot.data!["photos"].length) {
              return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: GestureDetector(
                          child: Image.network(
                            snapshot.data!['photos'][index]['src']['tiny'],
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            setState(() {
                              imagem = snapshot.data!['photos'][index]['src']
                                  ['tiny'];
                              Navigator.pop(context);
                            });
                          },
                          onLongPress: () {},
                        ),
                      ),
                    ],
                  ));
            } else {
              return Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    GestureDetector(
                      child: Text(
                        'Carregar mais...',
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                      onTap: () {
                        quantImages += 10;
                        Navigator.pop(context);
                        BuildBottomlSheet(context);
                      },
                    ),
                  ]));
            }
          }),
    );
  }

  int _getCount(List data) {
    if (search.isEmpty) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Future<Map> getImages() async {
    http.Response response;

    if (search.isEmpty) {
      print('oi');
      // erro = "Digite algum tópico para pesquisar!";
      response = await http.get(
          Uri.parse(
              "https://api.pexels.com/v1/search?query=primeira guerra mundial&locale=pt-BR&per_page=8"),
          headers: {
            'Authorization':
                '563492ad6f91700001000001ca281f10fab5412199c820b61a07bd42'
          });
    } else {
      print('ola');
      response = await http.get(
          Uri.parse(
              "https://api.pexels.com/v1/search?query=$search&locale=pt-BR&per_page=$quantImages"),
          headers: {
            'Authorization':
                '563492ad6f91700001000001ca281f10fab5412199c820b61a07bd42'
          });
    }
    return json.decode(response.body);
    ;
  }
}
