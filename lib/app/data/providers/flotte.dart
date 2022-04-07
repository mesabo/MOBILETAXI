import 'package:fredy_proprio/app/data/models/paiement_model.dart';
import 'package:fredy_proprio/app/utils/app_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlotteProvider {
  /// DEMANDER UN LIEN DE RECHARGEMENT
  Future<Paiement> getLienFlotte({required int proprio_id}) async {
    var url =
        APPURL.BASE_URL + APPURL.GET_LIEN_FLOTTE + "proprio_id=$proprio_id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var _res = parseReversement(response.body);
      if (_res.isNotEmpty) {
        return _res.first;
      } else {
        return Paiement();
      }
    } else {
      return Paiement();
    }
  }

  List<Paiement> parseReversement(responseBody) {
    final parsed =
        json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
    return parsed.map<Paiement>((json) => Paiement.fromJson(json)).toList();
  }
}
