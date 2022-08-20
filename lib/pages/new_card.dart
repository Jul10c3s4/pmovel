import 'package:flutter/material.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final _formKey = GlobalKey<FormState>();

  String nomeMateria = "";
  var _materias = ['Santos', 'Porto Alegre', 'Campinas', 'Rio de Janeiro'];
  var _itemSelecionado = 'Santos';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff180c36),
          title: const Text('MEMSTUDY'),
        ),
        backgroundColor: const Color(0xFFD6AAD5),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: UnderlineInputBorder(),
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: <Widget>[
                  const Text(
                    'MATÉRIA',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(width: 60),

                  /*Text("Selecione a cidade"),
                      
                      TextField(
                        decoration: const InputDecoration(labelText: 'Matéria'),
                        onSubmitted: (String userInput) {
                          setState(() {
                            debugPrint('chamei setState');
                            nomeMateria = userInput;
                          });
                        },
                      ),*/
                  DropdownButton<String>(
                      iconEnabledColor: Colors.white,
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
              /*const Text(
                  'DESCRIÇÃO',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),*/
              Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição',
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'IMAGEM',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              //inputar link externo
              const SizedBox(height: 48),
              ElevatedButton(
                //definir o tamanho
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff180c36),
                ),
                onPressed: () {} /*onPressed*/,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(Icons.check),
                ),
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
