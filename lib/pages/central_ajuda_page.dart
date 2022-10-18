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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.grey.shade800,
            size: 45,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Central de ajuda',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF6D39E6),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text(
              'Como podemos ajuda-lo ?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                child: TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: InkWell(child: Icon(Icons.send, size: 24, color: Colors.black,), onTap: (){}),
                  hintText: 'Envie-nos seu problema',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            )),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
