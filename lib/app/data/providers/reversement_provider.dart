import 'dart:convert';

import 'package:fredy_proprio/app/utils/app_urls.dart';
import 'package:http/http.dart' as http;

import '../models/reversement_model.dart';

class ReversementProvider {
  /// EXECUTER REQUETE GET
  Future<Reversement> postGenererLienPaiement(
      {required int proprio_id,
      required String montant,
      required String cle_connexion}) async {
    var url = APPURL.BASE_URL +
        APPURL.POST_REVERSEMENT +
        "proprio_id=$proprio_id&id_user=$proprio_id&cle_connexion=$cle_connexion&montant=$montant";
    final response = await http.post(Uri.parse(url));
    return parsReversement(response.body);
  }

  Reversement parsReversement(responseBody) {
    return Reversement.fromJson(json.decode(responseBody));
  }
}
