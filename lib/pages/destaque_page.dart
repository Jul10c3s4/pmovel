import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/pages/new_card.dart';
import 'package:app/pages/jogos_page.dart';
import 'package:app/widgets/cartao_resumo_card.dart';
import 'package:app/widgets/ultimo_acesso_card.dart';

class DestaquePage extends StatefulWidget {
  const DestaquePage({Key? key}) : super(key: key);

  @override
  State<DestaquePage> createState() => _DestaquePageState();
}

class _DestaquePageState extends State<DestaquePage> {
  CartaoResumo cartao1 = CartaoResumo(
      image:
          'https://www.historiadetudo.com/wp-content/uploads/2015/03/era-napoleonica.jpg',
      titulo: 'HISTÓRIA - Era Napoleônica',
      descricao:
          'Em vingança a decisão do Czar Alexandre I, o governo napoleônico decidiu invadir a Rússia em 1812. Os generais acostumados com grandes vitórias...');
  CartaoResumo cartao2 = CartaoResumo(
      image:
          'https://i.pinimg.com/564x/b5/f8/e7/b5f8e7bc5b9100a9fb63bf2cd4e34894.jpg',
      titulo: 'GEOGRAFIA - Geopolítica',
      descricao:
          'A geopolítica mundial evoluiu para incluir as dinâmicas populacionais e econômicas dentro deste jogo de poder, no tabuleiro político internacional...');
  CartaoResumo cartao3 = CartaoResumo(
      image:
          'https://s2.static.brasilescola.uol.com.br/img/2019/12/entre-tres-conjuntos(1).jpg',
      titulo: 'MATEMÁTICA - Conjuntos',
      descricao:
          'Conjuntos numéricos são ..., A partir deles podemos definir interseções, uniões e manipular-los, no geral.');
  CartaoResumo ultimoAcesso = CartaoResumo(
      image: 'https://www.hypeness.com.br/1/2018/11/PJacksonWW1_vertical.jpg',
      titulo: 'Card: HISTORIA - 1º Guerra Mundial',
      descricao:
          'A Primeira Guerra Mundial foi um conflito bélico global centrado na Europa, que começou em 28 de julho de 1914 e durou até 11 de novembro de 1918. A guerra envolveu as grandes potências...');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6239db),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Column(
            children: [
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.white),
                title: Text(
                  'Último acesso',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              CardUltimoAcesso(cartaoResumo: ultimoAcesso),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text(
                    'Seus cards',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                CardCartaoResumo(cartaoResumo: cartao1),
                CardCartaoResumo(cartaoResumo: cartao2),
                CardCartaoResumo(cartaoResumo: cartao3),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onPressedButton,
                  child: const Text(
                    'ADICIONAR NOVO CARD',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: const EdgeInsets.all(5.0),
              color: Colors.black,
              child: ElevatedButton(
                onPressed: onPressedButton2,
                child: const Text(
                  'JOGOS INTERATIVOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff180c36),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NewCard();
        },
      ),
    );
  }

  void onPressedButton2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return JogosPage();
        },
      ),
    );
  }
}
