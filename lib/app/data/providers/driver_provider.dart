import 'package:fredy_proprio/app/data/models/driver_model.dart';
import 'package:fredy_proprio/app/data/models/resultat_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_model.dart' as vehicule;
import 'package:fredy_proprio/app/utils/app_urls.dart';
import 'package:http/http.dart' as http;

import '../models/resume_model.dart';
import 'decoder_retour.dart';

class DriverProvider {
  /// EXECUTER REQUETE GET
  Future<Driver> getListerDrivers(
      {required int proprio_id, required String cle_connexion}) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_LISTER_DRIVERS +
        "proprio_id=$proprio_id&id_user=$proprio_id&cle_connexion=$cle_connexion";
    final response = await http.get(Uri.parse(url));
    return parseDrivers(response.body);
  }

  /// EXECUTER REQUETE GET
  Future<Resume> getListerHistoriqueDrivers({
    required int proprio_id,
    required int driver_id,
    required String date_debut,
    required String date_fin,
    required String cle_connexion,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_LISTER_HISTORIQUE_DRIVERS +
        "proprio_id=$proprio_id&id_user=$proprio_id&cle_connexion=$cle_connexion&date_debut=$date_debut&date_fin=$date_fin&driver_id=$driver_id";
    final response = await http.get(Uri.parse(url));
    return parseHistoriqueDrivers(response.body);
  }

  /// EXECUTER REQUETE GET
  Future<vehicule.Vehicule> getListerVehiculeLibre({
    required int proprio_id,
    required String cle_connexion,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.GET_VEHICULE_LIBRE +
        "proprio_id=$proprio_id&id_user=$proprio_id&cle_connexion=$cle_connexion";
    final response = await http.get(Uri.parse(url));
    return parseVehiculeLibre(response.body);
  }

  /// EXECUTER REQUETE PUT
  Future<Resultat> putAttribuerVehicule(
      {required int id_user,
      required int vehicule_id,
      required int driver_id,
      required String cle_connexion}) async {
    var url = APPURL.BASE_URL +
        APPURL.PUT_ATTRIBUER_VEHICULE +
        "chauffeur_id=$driver_id&vehicule_id=$vehicule_id&id_user=$id_user&cle_connexion=$cle_connexion";
    final response = await http.put(Uri.parse(url));
    return parseResultat(response.body);
  }

  /// EXECUTER REQUETE PUT
  Future<Resultat> putDriver({
    required int id,
    required int proprio_id,
    required String cle_connexion,
    required String nom,
    required String prenom,
    required String numero_permis,
    required String telephone,
    required String image_permis,
    required String numero_autorisation,
    required String numero_cert_aptitude,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.PUT_DRIVER +
        "id_user=$proprio_id&cle_connexion=$cle_connexion&id=$id&nom=$nom&prenom=$prenom&numero_permis=$numero_permis&telephone=$telephone&proprio_id=$proprio_id&image_permis=$image_permis&numero_autorisation=$numero_autorisation&numero_cert_aptitude=$numero_cert_aptitude";
    final response = await http.put(Uri.parse(url));
    return parseResultat(response.body);
  }

  /// EXECUTER REQUETE POST
  Future<Resultat> postDriver({
    required int proprio_id,
    required String cle_connexion,
    required String nom,
    required String prenom,
    required String numero_permis,
    required String telephone,
    required String image_permis,
    required String numero_autorisation,
    required String numero_cert_aptitude,
    image,
  }) async {
    var url = APPURL.BASE_URL +
        APPURL.POST_DRIVER +
        "id_user=$proprio_id&cle_connexion=$cle_connexion&nom=$nom&prenom=$prenom&numero_permis=$numero_permis&telephone=$telephone&proprio_id=$proprio_id&image_permis=$image_permis&numero_autorisation=$numero_autorisation&numero_cert_aptitude=$numero_cert_aptitude";
    final response = await http.post(Uri.parse(url));

    return parseResultat(response.body);
  }
}
