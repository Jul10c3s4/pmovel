import 'package:app/domain/user_domain/usuarios.dart';
import 'package:app/pages/config_page.dart';
import 'package:app/pages/esqueci_senha_page.dart';
import 'package:app/pages/principal/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usercontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF3D2080),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF1E1040),
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: Text(
              'Login',
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
              'images/lampa.png',
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
                        'Email: ',
                        style: TextStyle(
                          color: Color(0xFF7940FF),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
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
                        height: 10,
                      ),
                      Text(
                        'Senha: ',
                        style: TextStyle(
                          color: Color(0xFF7940FF),
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
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
                        height: 10,
                      ),
                      /*Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        })); */
                      InkWell(
                        child: Text(
                          'Esqueci a senha',
                          style: TextStyle(color: Color(0xFF7940FF)),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const EsqueciSenha();
                          }));
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: verificarLogin,
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade400,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    ));
  }

  void verificarLogin() {
    if (_formkey.currentState!.validate()) {
      String userlogin = 'aluno@gmail.com';
      String passwordLogin = '123456';

      String user = _usercontroller.text;
      String password = _passwordcontroller.text;

      if (userlogin == user && passwordLogin == password) {
        //Usuarios(email: _usercontroller);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      } else {
        print('senha ou email incorreto!');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                  'Tente novamente com outro email ou senha ou clique em esqueci a senha caso queira troca-la.'),
              title: Text(
                'Email ou senha incorreto !',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.blue.shade400,
                  ),
                )
              ],
            );
          },
        );
      }
    }
  }

  void verSenha() {}
}
