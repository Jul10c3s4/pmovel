import 'package:flutter/material.dart';

class NewCard extends StatefulWidget {
  const NewCard({Key? key}) : super(key: key);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff180c36),
          title: const Text('MEMSTUDY'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Novo card',
                        style: TextStyle(
                          color: Color(0xff180c36),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text('Insira os dados no novo card a seguir.'),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'MATÉRIA',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  /*
                  controller: userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo e-mail obrigatório';
                    }

                    return null;
                  },*/
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Matéria',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'ASSUNTO',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  /*  controller: ,
                  obscureText: true,*/
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Assunto',
                  ),
                  /* validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo senha obrigatório';
                    } else if (value.length < 6) {
                      return 'Campo senha deve conter no mínimo 6 digitos';
                    }

                    return null;
                  },*/
                ),
                const SizedBox(height: 16),
                const Text(
                  'DESCRIÇÃO',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'IMAGEM',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o link da imagem',
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff180c36),
                  ),
                  onPressed: () {} /*onPressed*/,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Adicionar card',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
