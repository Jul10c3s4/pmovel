import '../../domain/cartao_domain/cartaoDefinitivo.dart';
import '../../domain/half_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";
import 'dart:convert';

class SharedPrefsHelper {
  static getInstance() {
    return SharedPreferences.getInstance();
  }

  login(
    String userMail,
  ) async {
    SharedPreferences sharedPrefs = await getInstance();
    await sharedPrefs.setBool('USER', true);
    await sharedPrefs.setString('USERMAIL', userMail);
  }

  logout() async {
    SharedPreferences sharedPrefs = await getInstance();
    await sharedPrefs.setBool('USER', false);
  }

  Future<bool> getUser() async {
    SharedPreferences sharedPrefs = await getInstance();
    bool? isLogged = sharedPrefs.getBool('USER');

    return isLogged ?? false;
  }

  Future<String> getUserName() async {
    SharedPreferences sharedPrefs = await getInstance();
    String usermail = await sharedPrefs.getString('USERMAIL') ?? "invalid";

    return usermail;
  }

  /*Future<User> getDados() async{
    SharedPreferences sharedPrefs = await getInstance();
    User user = sharedPrefs.get as User;
    return user;
  }*/

  static Future<void> saveStateFHCP({
    required List<CardHalf> deck,
    required List<CardHalf> hand,
    required List<CardHalf> trash,
  }) async {
    SharedPreferences sharedPrefs = await getInstance();

    String deckS = "";
    for (int i = 0; i < deck.length; i++) {
      deckS += json.encode(deck[i].toJson()) + '===';
    }

    String handS = "";
    for (int i = 0; i < hand.length; i++) {
      handS += json.encode(hand[i].toJson()) + '===';
    }

    String trashS = "";
    for (int i = 0; i < trash.length; i++) {
      trashS += json.encode(trash[i].toJson()) + '===';
    }

    //print("deckS:");
    //print(deckS);

    //print("handS:");
    //print(handS);

    //print("trashS:");
    //print(trashS);

    await sharedPrefs.setString('FHCP_deck', deckS);
    await sharedPrefs.setString('FHCP_hand', handS);
    await sharedPrefs.setString('FHCP_trash', trashS);
  }

  static Future<List<List<CardHalf>>> getStateFHCP() async {
    SharedPreferences sharedPrefs = await getInstance();
    String deckS = await sharedPrefs.getString('FHCP_deck') ?? " ";
    String handS = await sharedPrefs.getString('FHCP_hand') ?? " ";
    String trashS = await sharedPrefs.getString('FHCP_trash') ?? " ";

    //retira o '===' do final do json
    /*
    deckS = deckS.substring(0, deckS.length - 3);
    handS = handS.substring(0, handS.length - 3);
    trashS = trashS.substring(0, trashS.length - 3);
    
    */

    if (deckS.contains("===") &&
        handS.contains("===") &&
        trashS.contains("===")) {
      List<String> deck = deckS.split('===');
      List<String> hand = handS.split('===');
      List<String> trash = trashS.split('===');

      deck.removeAt(deck.length - 1);
      hand.removeAt(hand.length - 1);
      trash.removeAt(trash.length - 1);

      print(deck.join("==="));
      print(hand.join("==="));
      print(trash.join("==="));

      List<CardHalf> listaDeck = <CardHalf>[];
      for (int i = 0; i < deck.length; i++) {
        CardHalf c =
            CardHalf.fromJson(json.decode(deck[i]) as Map<String, dynamic>);
        listaDeck.add(c);
      }

      List<CardHalf> listaHand = <CardHalf>[];
      for (int i = 0; i < hand.length; i++) {
        listaHand.add(
            CardHalf.fromJson(json.decode(deck[i]) as Map<String, dynamic>));
      }

      List<CardHalf> listaTrash = <CardHalf>[];
      for (int i = 0; i < trash.length; i++) {
        listaTrash.add(
            CardHalf.fromJson(json.decode(deck[i]) as Map<String, dynamic>));
      }

      //print(deck.join("==="));

      return [listaDeck, listaHand, listaTrash];
    } else {
      return [<CardHalf>[], <CardHalf>[], <CardHalf>[]];
    }
  }

  static Future<void> cleanStateFCHP() async {
    SharedPreferences sharedPrefs = await getInstance();
    await sharedPrefs.setString('FHCP_deck', " ");
    await sharedPrefs.setString('FHCP_hand', " ");
    await sharedPrefs.setString('FHCP_trash', " ");
  }
}
