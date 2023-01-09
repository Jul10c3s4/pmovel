import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/data/cartaoDao.dart';

class VerMeuCard extends StatefulWidget {
  final CartaoResumo cartaoResumo;
  //final UltimoAcesso ultimoAcesso;

  const VerMeuCard({Key? key, required this.cartaoResumo
      //required this.ultimoAcesso,
      })
      : super(key: key);

  @override
  _VerMeuCardState createState() => _VerMeuCardState();
}

class _VerMeuCardState extends State<VerMeuCard> {
  Future<List<CartaoResumo>> lista = CartaoDao().listarCartoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
        title: Text(
          widget.cartaoResumo.titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Matéria:'),
                SizedBox(
                  width: 10,
                ),
                Text('${widget.cartaoResumo.materia}',
                style: TextStyle(color: Colors.black,
                fontSize: 18, fontWeight: FontWeight.w400),),
              ],
            ),
            const SizedBox(height: 10),
            buildImage(),
            const SizedBox(height: 15),
            const Text(
              'DESCRIÇÃO',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: const Color(0xff6239db),
                  borderRadius: BorderRadius.circular(10)),
              height: 150,
              child: Text(
                widget.cartaoResumo.descricao,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  buildImage() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 350,
            height: 200,
            child: Image.network(
              widget.cartaoResumo.imagem,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
