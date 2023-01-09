import 'package:flutter/cupertino.dart';

class Usuarios {
  TextEditingController email = TextEditingController();

  Usuarios({required this.email});

  void setEmail(TextEditingController email) {
    this.email = email;
  }
}
