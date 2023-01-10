import 'dart:convert';

import 'package:app/data/DAO/cartaoDao.dart';
import 'package:app/data/api/card_api.dart';
import 'package:app/domain/cartao_domain/cartao_resumo.dart';
import 'package:app/pages/card/new_card.dart';
import 'package:app/pages/meusCards/meu_card.dart';
import 'package:http/http.dart' as http;
import 'package:app/domain/atributos_card.dart';
import 'package:app/data/DAO/atributosDao.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardDetalhes extends StatefulWidget {
  final CartaoResumo detalhes;

  const CardDetalhes({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _CardDetalhesState createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  Future<List<CartaoResumo>> lista = CartaoDao().listarCartoes();
  String? nomeCard;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff180c36),
          title: Text('${widget.detalhes.titulo}'),
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: 
            ListView(
              children: [
                Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        alert(
                            "Confirmação de upload",
                            "Tem certeza que deseja subir esse card para a nuvem ?",
                            SubirCard);
                      },
                      icon: Icon(
                        Icons.cloud_upload,
                        color: Colors.lightBlue,
                      )),
                  IconButton(
                      onPressed: () {
                        alertExluir(
                            "Confirmação de exclusão", DescerCard);
                      },
                      icon: Icon(
                        Icons.cloud_off,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        alert(
                            "Confirmação de atualização",
                            "Tem certeza que deseja atualizar esse card ?",
                            AtualizarCard);
                      },
                      icon: Icon(
                        Icons.update,
                        color: Colors.blue,
                        size: 28,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Matéria: '),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.detalhes.materia}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 350,
                      height: 200,
                      child: Image.network(
                        widget.detalhes.imagem,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Text(
                    'DESCRIÇÃO',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: const Color(0xff6239db),
                  borderRadius: BorderRadius.circular(10)),
              height: 150,
              child: Text(
                widget.detalhes.descricao,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),

                  //buildImage(),
                ],
              ),
            ),
              ],
            ))
            
          ],
        ));
  }

  void SubirCard() async {
    String Titulo = widget.detalhes.titulo;
    String Assunto = widget.detalhes.materia;
    String Descricao = widget.detalhes.descricao;
    String imagem = widget.detalhes.imagem;
    String text = "Card enviado para a nuvem com sucesso!";

    CartaoResumo cartaoResumo = new CartaoResumo(
        materia: Assunto, titulo: Titulo, descricao: Descricao, imagem: imagem);
    try {
      var response = await http.post(
          Uri.parse("https://api-memstudy.juliocesar131.repl.co/admin/add"),
          body: {
            "titulo": cartaoResumo.titulo.toString(),
            "assunto": cartaoResumo.materia.toString(),
            "descricao": cartaoResumo.descricao.toString(),
            "imagem": cartaoResumo.imagem.toString(),
          });
      if (response.statusCode == 409) {
        text = "Esse card já está na nuvem!";
      }
      showSnackBar(text, Colors.deepPurpleAccent);
    } catch (e) {
      showSnackBar("Erro ao enviar o card!", Colors.redAccent);
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void DescerCard() async {
    if (_formkey.currentState!.validate()) {
      String Titulo = widget.detalhes.titulo;
      String Assunto = widget.detalhes.materia;
      String Descricao = widget.detalhes.descricao;
      String imagem = widget.detalhes.imagem;
      String text = "Card excluido com sucesso!";
      CartaoResumo cartaoResumo = new CartaoResumo(
          materia: Assunto,
          titulo: Titulo,
          descricao: Descricao,
          imagem: imagem);
        try {
          /*/ws/$ cep /json/ */
          var url = Uri.parse(
              "https://api-memstudy.juliocesar131.repl.co/admin/${cartaoResumo.titulo}/${cartaoResumo.descricao}");
          final response = await http.delete(url);
          await CartaoDao().ExcluirCartao(cartaoResumo: cartaoResumo);
          showSnackBar(text, Colors.purple);
          setState(() {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          });
        } catch (e) {
          showSnackBar(
              "Erro ao enviar o card: " + e.toString(), Colors.redAccent);
        }
    }
  }

  void AtualizarCard() async {
    String Titulo = widget.detalhes.titulo;
    String Assunto = widget.detalhes.materia;
    String Descricao = widget.detalhes.descricao;
    String imagem = widget.detalhes.imagem;
    String text = "Card atualizado na nuvem com sucesso!";

    CartaoResumo cartaoResumo = new CartaoResumo(
        materia: Assunto, titulo: Titulo, descricao: Descricao, imagem: imagem);

    final recCartaoResumo = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewCard(cartaoResumo: cartaoResumo)));
    Navigator.pop(context);
    if (recCartaoResumo != null) {
      if (cartaoResumo != null) {
        var url = Uri.parse(
            "https://api-memstudy.juliocesar131.repl.co/admin/${cartaoResumo.descricao}");
        final responseGet = await http.get(url);
        if (responseGet.statusCode == 422) {
          text = "card atualizado!";
          showSnackBar(text, Colors.purple);
          setState(() {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MeuCard();
                },
              ),
            );
          });
        } else {
          try {
            var url = Uri.parse(
                "https://api-memstudy.juliocesar131.repl.co/admin/${cartaoResumo.titulo}/${cartaoResumo.descricao}");
            final response = await http.put(url, body: {
              "titulo": recCartaoResumo.titulo.toString(),
              "assunto": recCartaoResumo.materia.toString(),
              "descricao": recCartaoResumo.descricao.toString(),
              "imagem": recCartaoResumo.imagem.toString(),
            });
            if (response.statusCode == 200) {
              showSnackBar(text, Colors.purple);
              setState(() {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MeuCard();
                    },
                  ),
                );
              });
            } else if (response.statusCode == 500) {
              text = "Erro ao atualizar o card na nuvem!";
              showSnackBar(text, Colors.purple);
            }
          } catch (e) {
            showSnackBar(
                "Erro ao atualizar o card: " + e.toString(), Colors.redAccent);
          }
        }
      }
    }
  }

  showSnackBar(String msg, Color cor) {
    final snackBar = SnackBar(
      elevation: 20,
      behavior: SnackBarBehavior.floating,
      backgroundColor: cor,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  alert(
    String title,
    String subtitle,
    Function function,
    /*void navigator*/
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            subtitle,
            style: TextStyle(),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                function();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            )
          ],
        );
      },
    );
  }

  alertExluir(
    String title,
    Function function,
    /*void navigator*/
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formkey,
                child: TextFormField(
                  onChanged: (value) {
                    nomeCard = value;
                  },
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Informe algum titulo!";
                    }
                    else if (value != widget.detalhes.titulo) {
                      return "titulo incorreto!";
                    }
                    return null;
                    ;
                  },
                  decoration: InputDecoration(
                    labelText: "Digite o titulo do card ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                function();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            )
          ],
        );
      },
    );
  }
}
