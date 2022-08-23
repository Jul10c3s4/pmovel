import 'dart:html';

import 'package:app/pages/destaque_page.dart';
import 'package:flutter/material.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final _formKey = GlobalKey<FormState>();

  String nomeMateria = "";
  var _materias = [
    'Português',
    'Geografia',
    'História',
    'Biologia',
    'Física',
    'Matemática'
  ];
  var _itemSelecionado = 'História';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff180c36),
          title: const Text('MEMSTUDY'),
        ),
        backgroundColor: const Color(0xFF7940FF).withOpacity(0.5),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Novo Card',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: UnderlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: [
                      const Text(
                        'MATÉRIA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      DropdownButton<String>(
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
                  )
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DESCRIÇÃO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descrição',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'IMAGEM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //inputar link externo
                    TextFormField(
                      cursorColor: Colors.purple,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Url da imagem desejada',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: const Size(40, 30),
                  backgroundColor: const Color(0xff180c36),
                ),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Adicionar novo card'),
                    content: const Text('Um novo card será adicionado.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Icon(Icons.check),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dropDownItemSelected(String novoItem) {
    setState(() {
      _itemSelecionado = novoItem;
    });
  }
}
