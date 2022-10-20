import 'package:app/pages/telas%20de%20login/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({Key? key}) : super(key: key);

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  TextEditingController _userController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF3D2080),
      body: ListView(
        children: [
          Column(
        children: [
          SizedBox(height: 5, width: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
              }, icon: Icon(Icons.arrow_back))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF1E1040),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Text(
              'Esqueci a senha',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nova Senha',
                style: TextStyle(color: Color(0xFF7940FF), fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
                child: Image.asset(
              'assets/images/help.png',
              fit: BoxFit.cover,
            )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _userController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo e-mail obrigatório';
                          }
                          else if(!value!.contains('@')) {
                            return 'Falta o @';}
                          return null;
                        },
                        style: TextStyle(
                          color: Color(0xFF5B30BF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            hintText: 'aluno@gmail.com',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: verificarLogin,
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple.shade400,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
        ],
      ) 
    ));
  }

  void verificarLogin() {
    if (_formkey.currentState!.validate()) {
      String user = _userController.text;

      if (user != '') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Confirmação de Email',
                style: TextStyle(
                  color: Colors.green
                ),
              ),
              content: Text(
                'Tem certeza que o email (${user}) está correto ?',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
                  },
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.blue.shade400,
                    backgroundColor: Colors.blue.shade400
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red            
                  ),
                )
              ],
            );
          },
        );
      }
    }
  }
}
