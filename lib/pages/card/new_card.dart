import 'package:app/domain/atributos_card.dart';
import 'package:app/pages/principal/destaque_page.dart';
import 'package:flutter/material.dart';
import 'package:app/data/atributosDao.dart';
import 'package:app/domain/atributos_card.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  TextEditingController tituloController = new TextEditingController();
  TextEditingController descricaoController = new TextEditingController();
  TextEditingController materiaController = new TextEditingController();
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
        ),
        backgroundColor: const Color(0xffa08ad7),
        body: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        child:const Text('NOVO CARD',
                            style: TextStyle(fontSize: 25)),
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
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'MATÉRIA',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                    return 'Campo e-mail obrigatório';
                  }
                  return null;
                },
                      ),

                      const SizedBox(height: 16),
                      //inputar link externo
                      TextFormField(
                        cursorColor: Colors.purple,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Url da imagem desejada',
                        ),
                        /*controller: 
                        validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo e-mail obrigatório';
                  }
                  return null;
                },*/
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: const Size(40, 30),
                              backgroundColor: const Color(0xff180c36),
                            ),
                            onPressed: onPressed(),
                            child: const Icon(Icons.check),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  onPressed() async {
    if (_formKey.currentState!.validate()) {
      String tituloDigitado = tituloController.text;
      String materiaDigitada = _itemSelecionado;
      String descricaoDigitada = descricaoController.text;

      Atributos atributos = Atributos(materia: materiaDigitada, titulo: tituloDigitado, descricao: descricaoDigitada);
      await AtributosDao().salvarAtributos(atributos: atributos);

      showSnackBar('Novo cartão foi salvo com sucesso!');
      Navigator.pop(context);

    } else {
      showSnackBar("Erro na validação");
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
}
