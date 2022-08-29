import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'login.dart';

class Criarconta extends StatefulWidget {
  const Criarconta({Key? key}) : super(key: key);

  @override
  State<Criarconta> createState() => _CriarcontaState();
}

class _CriarcontaState extends State<Criarconta> {
  TextEditingController _usercontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _nameusercontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF3D2080),
      body: Column(
        children: [
          SizedBox(
            height: 5,
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
                  },
                  icon: Icon(Icons.arrow_back))
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF1E1040),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Text(
              'Criar nova conta',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Flexible(
            child: Container(
                child: Image.asset(
              'images/lamp.png',
              fit: BoxFit.cover,
            )),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Nome: ',
                        style: TextStyle(
                          color: Color(0xFF7940FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _nameusercontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo nome obrigatório';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Color(0xFF5B30BF),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                              hintText: 'usuario',
                              hintStyle: TextStyle(
                                color: Color(0xFF5B30BF),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Email: ',
                        style: TextStyle(
                          color: Color(0xFF7940FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _usercontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo e-mail obrigatório';
                            }
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
                                color: Color(0xFF5B30BF),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Senha: ',
                        style: TextStyle(
                          color: Color(0xFF7940FF),
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo senha obrigatório';
                            } else if (value.length < 6) {
                              return 'Campo senha deve conter no mínimo 6 dígitos';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Color(0xFF5B30BF),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                              hintText: '******',
                              hintStyle: TextStyle(
                                color: Color(0xFF5B30BF),
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      /*Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        })); */

                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: verificarConta,
                        child: Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade400,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ],
                  ))),
        ],
      ),
    ));
  }

  void verificarConta() {
    if (_formkey.currentState!.validate()) {
      String user = _usercontroller.text;
      String nameuser = _nameusercontroller.text;

      if (user != '' && nameuser != '') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Confirmação de criação de conta',
                style: TextStyle(color: Colors.green),
              ),
              content: Text(
                'Tem certeza que os dados registrados estão corretos ?',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Parabéns sua conta foi criada!',
                              style: TextStyle(color: Colors.green),
                            ),
                            content: Container(
                                child: Image.asset(
                              'images/parabens.png',
                              fit: BoxFit.cover,
                            )),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Login();
                                  }));
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue),
                              )
                            ],
                          );
                        });
                  },
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.blue.shade400,
                      backgroundColor: Colors.blue.shade400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.red),
                )
              ],
            );
          },
        );
      }
    }
  }
}
