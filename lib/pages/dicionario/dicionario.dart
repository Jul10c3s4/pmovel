/*
https://learn.microsoft.com/pt-br/xamarin/xamarin-forms/data-cloud/azure-cognitive-services/text-translation
*/

import 'package:app/data/api/dicionario_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioPalavra extends StatefulWidget{

  const FormularioPalavra({Key? key,}) : super(key:key);
  @override
  _FormularioPalavra createState() => _FormularioPalavra();
}

class _FormularioPalavra extends State<FormularioPalavra>{

  final _formKey = GlobalKey<FormState>();
  static String palavra = "Significado: ";
  TextEditingController palavraController = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF6E39F5),
      appBar: AppBar(
        title: buildText(text: "Dicionario de Palavras", size: 24),
        backgroundColor: const Color(0xFF180C36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Palavra',
                            ),
                            controller: palavraController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo sem preenchimento";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: onPressed,
                      child: buildText(text: "Enviar palavra", size: 18),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF180C36),
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)
                  ),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(text: palavra, size: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    if (_formKey.currentState!.validate()) {
      String significado = await DicionarioAPI().buscarSignificado(palavra: palavraController.text);
      setState(() {
        palavra = significado;
      });
    }
  }

  buildText({required String text, required double size}){
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

}
