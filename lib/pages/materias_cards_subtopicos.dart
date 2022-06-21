import 'package:flutter/material.dart';
import 'package:app/domain/card_materia.dart';

class MateriasCardsSubtopicos extends StatefulWidget {
  final CardMateria cardMateria;

  const MateriasCardsSubtopicos({
    Key? key,
    required this.cardMateria,
  }) : super(key: key);

  @override
  State<MateriasCardsSubtopicos> createState() => _MateriasCardsSubtopicos();
}

class _MateriasCardsSubtopicos extends State<MateriasCardsSubtopicos> {
  @override
  CardMateria get pacote => widget.cardMateria;
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
