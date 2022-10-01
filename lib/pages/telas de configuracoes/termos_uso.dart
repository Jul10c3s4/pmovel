import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Termos_uso extends StatefulWidget {
  const Termos_uso({Key? key}) : super(key: key);

  @override
  State<Termos_uso> createState() => _Termos_usoState();
}

class _Termos_usoState extends State<Termos_uso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1E1040),
        title: Text(
          'Termos de Uso',
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                            child: Image.asset(
                          'assets/images/termo.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
                
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 40,)
                    ],
                  ),

                )



              ],
            )
          ],
        ),
      ),

      
    );
  }
}
