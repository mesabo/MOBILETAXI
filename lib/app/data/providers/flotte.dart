import 'package:fredy_proprio/app/data/models/flotte_model.dart';
import 'package:fredy_proprio/app/data/models/paiement_model.dart';
import 'package:fredy_proprio/app/utils/app_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlotteProvider {
  /// DEMANDER UN LIEN DE RECHARGEMENT
  Future<Flotte> getLienFlotte(
      {required int proprio_id, required String cle_connexion}) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_LIEN_FLOTTE +
        "proprio_id=$proprio_id&id_user=$proprio_id&cle_connexion=$cle_connexion";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Flotte.fromJson(json.decode(response.body));
    } else {
      return Flotte();
    }
  }
}
