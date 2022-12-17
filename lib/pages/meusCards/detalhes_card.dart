import 'dart:convert';

import 'package:app/data/api/card_api.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:http/http.dart' as http;
import 'package:app/domain/atributos_card.dart';
import 'package:app/data/bd/atributosDao.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardDetalhes extends StatefulWidget {
  final Atributos detalhes;

  const CardDetalhes({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _CardDetalhesState createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  Future<List<Atributos>> lista = AtributosDao().listarAtributos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
        title: const Text('MEUS CARDS'),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Wrap(
                      spacing: 30.0,
                      children: [
                        Text(
                          widget.detalhes.titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
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
                          alert(
                              "Confirmação de exclusão da nuvem",
                              "Tem certeza que deseja tirar esse card da nuvem ?",
                              DescerCard);
                        },
                        icon: Icon(
                          Icons.cloud_off,
                          color: Colors.red,
                        ))
                  ],
                ),
                //const SizedBox(width: 6.0),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('Matéria'),
                Icon(Icons.expand_more_outlined),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'DESCRIÇÃO',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
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
            const SizedBox(height: 4.0),
            //buildImage(),
          ],
        ),
      ),
    );
  }

  void SubirCard() async {
    String Titulo = widget.detalhes.titulo;
    String Assunto = widget.detalhes.materia;
    String Descricao = widget.detalhes.descricao;
    String text = "Card enviado para a nuvem com sucesso!";

    CartaoResumo cartaoResumo = new CartaoResumo(
        materia: Assunto, titulo: Titulo, descricao: Descricao);
    try {
      var response = await http.post(
          Uri.parse("https://api-memstudy.juliocesar131.repl.co/admin/add"),
          body: {
            "titulo": cartaoResumo.titulo.toString(),
            "assunto": cartaoResumo.materia.toString(),
            "descricao": cartaoResumo.descricao.toString()
          });
      if (response.statusCode == 409) {
        text = "Esse card já está na nuvem!";
      }
      showSnackBar(text, Colors.deepPurpleAccent);
    } catch (e) {
      showSnackBar("Erro ao enviar o card: " + e.toString(), Colors.redAccent);
    }
  }

  void DescerCard() async {
    String Titulo = widget.detalhes.titulo;
    String Assunto = widget.detalhes.materia;
    String Descricao = widget.detalhes.descricao;
    String text = "Card excluido da nuvem com sucesso!";
    CartaoResumo cartaoResumo = new CartaoResumo(
        materia: Assunto, titulo: Titulo, descricao: Descricao);
    try {
      /*/ws/$ cep /json/ */
      var url = Uri.parse(
          "https://api-memstudy.juliocesar131.repl.co/admin/${cartaoResumo.titulo}/${cartaoResumo.descricao}");
      final response = await http.delete(url);
      if (response.statusCode == 422) {
        text = "Esse card ainda não está na nuvem!";
      }
      showSnackBar(text, Colors.purple);
    } catch (e) {
      showSnackBar("Erro ao enviar o card: " + e.toString(), Colors.redAccent);
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

  alert(String title, String subtitle, Function function) {
    showDialog(
      context: context,
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
              onPressed: () {
                function();
                Navigator.of(context).pop();
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
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Text(
                'Não',
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
