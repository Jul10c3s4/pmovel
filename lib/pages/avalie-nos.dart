import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Avalie extends StatefulWidget {
  const Avalie({Key? key}) : super(key: key);

  @override
  State<Avalie> createState() => _AvalieState();
}

class _AvalieState extends State<Avalie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1E1040),
        title: Text(
          'Avalie-nos',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/config');
          },
          icon: Icon(
            Icons.close,
            size: 45,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,
        vertical: 30),
        child: Column(
                children: [
                  Flexible(
            child: Container(
                child: Image.asset(
              'images/avaliar.png',
              fit: BoxFit.cover,
            )),
          ),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text(
                          'Dê um feedback da sua experiência com o nosso app !',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Envie-nos um comentário sobre o app',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.send,
                                color: Colors.lightBlue,
                              ),
                            )
                          ),
                        ),
                       
                      ],
                    ),
                  )
                ],
              )
           
      ),
    );
  }
}
