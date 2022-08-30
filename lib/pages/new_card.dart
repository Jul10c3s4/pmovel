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
                child: const Text('NOVO CARD', style: TextStyle(fontSize: 25)),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: UnderlineInputBorder(),
                  prefixIconColor: Colors.white,
                ),
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
              SafeArea(
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
                child: const Text('NOVO CARD', style: TextStyle(fontSize: 25)),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: UnderlineInputBorder(),
                  prefixIconColor: Colors.white,
                ),
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
                  labelText: 'Descrição',  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Descrição',
                ),
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
