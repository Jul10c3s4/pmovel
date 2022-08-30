import 'package:flutter/material.dart';

class Conteudos {
  final String titulo;
  final String titleAppBar;
  final IconData icon;
  final String imagem;
  final String conceito;

  Conteudos(
      this.titulo, this.icon, this.titleAppBar, this.imagem, this.conceito);

  static Conteudos conteudosDeSubstantivos = Conteudos("SUBSTANTIVOS", Icons.book,"PORTUGUÊS","https://static3.depositphotos.com/1006126/210/i/950/depositphotos_2102902-stock-photo-alphabet-letters-made-with-diamonds.jpg", "Qualquer classe gramatical antecedida por artigo, pronome demonstrativo, pronome indefinido ou pronome possessivo vira substantivo: o amar, um amanhã, nosso sentir, um não sei quê, o sim, o não, algum talvez, este falar, um abrir-se, o querer, aquele claro-escuro....");

  static Conteudos conteudosDeAdjetivos = Conteudos("ADJETIVOS", Icons.book,"PORTUGUÊS","https://i.pinimg.com/736x/22/20/e0/2220e036644ab7c29963fe63bb2e20af.jpg", "Mas, afinal, o que é um adjetivo? O adjetivo é uma classe de palavras variável, que é usada para colocar uma qualidade ao substantivo. Quando falamos em variável, quer dizer que pode mudar de acordo com gênero e número, seguindo os termos que qualificam. Os adjetivos também podem alterar o grau para passar maior ou menor veemência de determinada característica.");

  static Conteudos conteudosDeAdverbios = Conteudos("ADVÉRBIOS", Icons.book,"PORTUGUÊS","https://blog.flaviarita.com/wp-content/uploads/2020/03/Imagem1-1.png", "Adjectives Describe NounsIn Spanish, adjetivos can be used to describe a person place or thing, and are most often found immediately before the noun. For example, the sentence Tom is an excellent singer / Tom es un excelente cantante,");

  static Conteudos conteudosDeGeometriaPlana = Conteudos("Geometria Plana",  Icons.calculate, "MATEMÁTICA",'http://3.bp.blogspot.com/-yXKli2GIO2A/Tt9Y0QBIktI/AAAAAAAAAUQ/1oomMYWZuOg/s1600/figuras_geometricas21.jpg', 'A geometria plana ou euclidiana é a vertente da matemática que estuda as figuras geométricas que não possuem volume, como triângulos, retângulos, círculos, entre outros.Criado pelo matemático Euclides de Alexandria, a geometria plana vai explorar as propriedades e tamanho das formas, além de aplicar fórmulas matemáticas para descobrir seu perímetro e área. Esta área apresenta certas propriedades que nos ajudam a compreender as figuras mais complexas, como os conceitos de ponto, linha, plano e ângulo.');

  static Conteudos conteudosDeGeometriaEspacial = Conteudos("Geometria Espacial", Icons.category, "MATEMÁTICA",'https://s5.static.brasilescola.uol.com.br/be/2022/08/poliedros-coloridos.jpg',  "A geometria espacial é a análise de sólidos no espaço, ou seja, é a geometria para objetos tridimensionais, diferente da geometria plana, que é o estudo de figuras bidimensionais. Assim como esta, aquela surge com base em conceitos primitivos, sendo eles: ponto, reta, plano e espaço.");

  static Conteudos conteudosDeGeometriaAnalitica = Conteudos("Geometria Analítica",  Icons.circle,"MATEMÁTICA",'https://s1.static.brasilescola.uol.com.br/be/conteudo/images/formas-geometricas-estudadas-com-auxilio-algebra-57b71f717e258.jpg',  "A geometria espacial é a análise de sólidos no espaço, ou seja, é a geometria para objetos tridimensionais, diferente da geometria plana, que é o estudo de figuras bidimensionais. Assim como esta, aquela surge com base em conceitos primitivos, sendo eles: ponto, reta, plano e espaço.");

  static Conteudos conteudosDePreHistoria = Conteudos("PRÉ-HISTÓRIA", Icons.history_edu, "HISTÓRIA", "https://st.depositphotos.com/1000647/2294/i/600/depositphotos_22942090-stock-photo-vintage-magnifying-glass-lies-on.jpg", "A Pré-história é o período mais longo da História da humanidade. Começou a cerca de 2.500.000 anos e terminou com o surgimento da escrita por volta de 3.000 a.C. na Mesopotâmia, com os sumérios. De acordo com a utilização da tecnologia entre os hominídeos, a Pré-História é dividida em Idade da Pedra e Idade dos Metais.");

  static Conteudos conteudosDeEraPaleolitica = Conteudos("ERA PALEOLÍTICA", Icons.forest, "HISTÓRIA", "https://www.estudokids.com.br/wp-content/uploads/2014/11/idade-da-pedra-periodos-e-seu-fim-1200x675.jpg", "A Pré-história é o período mais longo da História da humanidade. Começou a cerca de 2.500.000 anos e terminou com o surgimento da escrita por volta de 3.000 a.C. na Mesopotâmia, com os sumérios. De acordo com a utilização da tecnologia entre os hominídeos, a Pré-História é dividida em Idade da Pedra e Idade dos Metais.");

  static Conteudos conteudosDeEraMesolitica= Conteudos("ERA MESOLÍTICA", Icons.cabin, "HISTÓRIA", "https://escolaeducacao.com.br/wp-content/uploads/2020/06/mesol%C3%ADtico-1.jpg", "A Pré-história é o período mais longo da História da humanidade. Começou a cerca de 2.500.000 anos e terminou com o surgimento da escrita por volta de 3.000 a.C. na Mesopotâmia, com os sumérios. De acordo com a utilização da tecnologia entre os hominídeos, a Pré-História é dividida em Idade da Pedra e Idade dos Metais.");

}
