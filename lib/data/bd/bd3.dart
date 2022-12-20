import 'package:app/domain/container.dart';

class BDConteudo {
  static List<Conteudo> lista = [
    
  Conteudo(
    titulo: "Central de ajuda",
     rota: '/central-ajuda'),

  Conteudo(
    titulo: "Sobre o Memstudy",
     rota: '/sobre'),

  Conteudo(
    titulo: "Avalie-nos",
     rota: '/avalie-nos'),

  Conteudo(
    titulo: "Termos de uso",
     rota: '/termos_uso'),

  Conteudo(
    titulo: "Sair",
     rota: '/login'),
  ];

  static Future<List<Conteudo>> getConteudo() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 2));
    print("DEPOIS");
    return lista;
  }
}
