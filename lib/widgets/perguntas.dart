import 'package:flutter/material.dart';
import '../domain/cartao_domain/cartaoDefinitivo.dart';

class PerguntasWidget extends StatefulWidget {
  final CardDef cardD;
  final bool isTitleQuestion;

  const PerguntasWidget({
    Key? key,
    required this.cardD,
    this.isTitleQuestion = true,
  }) : super(key: key);

  @override
  _PerguntasWidgetState createState() => _PerguntasWidgetState();
}

class _PerguntasWidgetState extends State<PerguntasWidget> {
  int opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF6E39F5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(16),
      //margin: EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Card(
          color: Color(0xFF351B75),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Pergunta",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "00:01:36",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ]),
              SizedBox(height: 16),
              Text(
                widget.isTitleQuestion
                    ? widget.cardD.titulo
                    : widget.cardD.descricao,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opcaoSelecionada = 1;
            });
          },
          child: Text(
            widget.isTitleQuestion
                ? widget.cardD.descricao
                : widget.cardD.titulo,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                opcaoSelecionada == 1 ? Color(0xFF180C36) : Color(0xFF351B75),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opcaoSelecionada = 2;
            });
          },
          child: Text(
            "Martin Luther King",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                opcaoSelecionada == 2 ? Color(0xFF180C36) : Color(0xFF351B75),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opcaoSelecionada = 3;
            });
          },
          child: Text(
            "Silêncio",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                opcaoSelecionada == 3 ? Color(0xFF180C36) : Color(0xFF351B75),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opcaoSelecionada = 4;
            });
          },
          child: Text(
            "Opcao4",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                opcaoSelecionada == 4 ? Color(0xFF180C36) : Color(0xFF351B75),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (opcaoSelecionada != 0) {
              Navigator.pop(context, false);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Enviar Resposta",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFB6CCD7),
          ),
        ),
        SizedBox(height: 16),
      ]),
    );

    void marcarResposta() {}
  }
}
