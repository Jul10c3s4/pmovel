import 'package:flutter/material.dart';

class CentralAjuda extends StatefulWidget {
  const CentralAjuda({Key? key}) : super(key: key);

  @override
  State<CentralAjuda> createState() => _CentralAjudaState();
}

class _CentralAjudaState extends State<CentralAjuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1E1040),
        title: Text(
          'Central de Ajuda',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(context, '/config');
          },
          child: Icon(
            Icons.close,
            size: 45,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,
        vertical: 30),
        child: Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        Container(
                            child: Image.asset(
                          'images/cereDuvidas.png',
                          fit: BoxFit.cover,
                        )),
                      
                        Text(
                          'Informe a sua dúvida para respondermos assim que possível:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Diga-nos a sua dúvida:',
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

                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
