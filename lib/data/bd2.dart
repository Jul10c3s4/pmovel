import 'package:app/domain/cartao_resumo.dart';

class BD {
  static List<CartaoResumo> lista = [
    CartaoResumo(
        image:
            'https://www.historiadetudo.com/wp-content/uploads/2015/03/era-napoleonica.jpg',
        titulo: 'HISTÓRIA - Era Napoleônica',
        descricao:
            'Em vingança a decisão do Czar Alexandre I, o governo napoleônico decidiu invadir a Rússia em 1812. Os generais acostumados com grandes vitórias...'),
    CartaoResumo(
        image:
            'https://i.pinimg.com/564x/b5/f8/e7/b5f8e7bc5b9100a9fb63bf2cd4e34894.jpg',
        titulo: 'GEOGRAFIA - Geopolítica',
        descricao:
            'A geopolítica mundial evoluiu para incluir as dinâmicas populacionais e econômicas dentro deste jogo de poder, no tabuleiro político internacional...'),
    CartaoResumo(
        image:
            'https://s2.static.brasilescola.uol.com.br/img/2019/12/entre-tres-conjuntos(1).jpg',
        titulo: 'MATEMÁTICA - Conjuntos',
        descricao:
            'Conjuntos numéricos são ..., A partir deles podemos definir interseções, uniões e manipular-los, no geral.'),
    CartaoResumo(
        image: 'https://www.hypeness.com.br/1/2018/11/PJacksonWW1_vertical.jpg',
        titulo: 'HISTORIA - 1º Guerra Mundial',
        descricao:
            'A Primeira Guerra Mundial foi um conflito bélico global centrado na Europa, que começou em 28 de julho de 1914 e durou até 11 de...'),
  ];

  static Future<List<CartaoResumo>> getCartaoResumo() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 4));
    print("DEPOIS");
    return lista;
  }
}
