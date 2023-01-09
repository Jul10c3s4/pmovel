import 'package:app/data/shared_preferences/sharedPreferences.dart';
import 'package:app/data/DAO/userDao.dart';
import 'package:app/domain/user_domain/user.dart';
import 'package:app/pages/telas%20de%20configuracoes/config_page.dart';
import 'package:app/pages/telas%20de%20login/criar_conta.dart';
import 'package:app/pages/telas%20de%20login/esqueci_senha_page.dart';
import 'package:app/pages/splashscreen.dart';
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
  TextEditingController _userEmailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool visivel = true;
  bool carregando = false;
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
              Container(
                  child: Image.asset(
                'assets/images/cere_oi.png',
                fit: BoxFit.cover,
              )),
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
                              color: Colors.black,
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
                              controller: _userEmailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo e-mail obrigatório';

                                } else if (!value.contains('@')) {

                                  return 'Falta o @';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Color(0xFF5B30BF),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_outlined,
                                    color: Color(0xFF1E1040),
                                  ),
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
                            height: 10,
                          ),
                          Text(
                            'Senha: ',
                            style: TextStyle(
                              color: Colors.black,
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
                              controller: _passwordcontroller,
                              obscureText: visivel,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    carregando = false;
                                  });
                                  return 'Campo senha obrigatório';
                                } else if (value.length < 6) {
                                  setState(() {
                                    carregando = false;
                                  });
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
                                  prefixIcon: Icon(
                                    Icons.lock_sharp,
                                    color: Color(0xFF1E1040),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visivel = !visivel;
                                        });
                                      },
                                      icon: Icon(
                                        visivel
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color(0xFF1E1040),
                                      )),
                                  hintText: '******',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
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
                              style: TextStyle(
                                  color: Color(0xFF7940FF),
                                  fontWeight: FontWeight.bold),
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
                            onPressed: () {
                              setState(() {
                                verificarLogin();
                              });
                            },
                            child: !carregando
                                ? Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade400,
                              padding: EdgeInsets.symmetric(vertical: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Não possui uma conta?'),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: Text(
                                  'Criar conta',
                                  style: TextStyle(
                                      color: Color(0xFF7940FF),
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Criarconta();
                                  }));
                                },
                              ),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        ],
      ),
    ));
  }

  void verificarLogin() async {
    carregando = true;
    await Future.delayed(const Duration(seconds: 2));
    if (_formkey.currentState!.validate()) {
      String email = _userEmailcontroller.text;
      String password = _passwordcontroller.text;

      bool resultado =
          await UserDao().autenticar(userEmail: email, password: password);

      print(resultado);
      if (resultado) {
        SharedPrefsHelper().login(email);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const Screen(rota: "/homepage");
          }),
        );
      } else {
        setState(() {
          carregando = false;
        });
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
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
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
