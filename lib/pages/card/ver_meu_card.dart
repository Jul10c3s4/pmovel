import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';

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
  Future<List<CartaoResumo>> lista = CartaoDao.listarCartao();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
        title: const Text('MEMSTUDY'),
      ),
      backgroundColor:  Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Wrap(
                      spacing: 30.0,
                      children: [
                        Text(
                          widget.cartaoResumo.titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //const SizedBox(width: 6.0),
                Row(
                  children: const [
                    Icon(Icons.bookmark_outline),
                    Icon(Icons.edit),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('Matéria'),
                Icon(Icons.expand_more_outlined),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'DESCRIÇÃO',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
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
            const SizedBox(height: 4.0),
            buildImage(),
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
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8),
          ),
          child: Container(
            width: 300,
            height: 350,
            child: Image.network(widget.cartaoResumo.image),
          ),
        ),
      ],
    );
  }
}
                  
