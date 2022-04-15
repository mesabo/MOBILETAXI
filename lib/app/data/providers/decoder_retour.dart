import 'dart:convert';

import 'package:fredy_proprio/app/data/models/dashboard_resumer_model.dart';
import 'package:fredy_proprio/app/data/models/financeresume_model.dart';
import 'package:fredy_proprio/app/data/models/proprio_model.dart';
import 'package:fredy_proprio/app/data/models/resultat_model.dart';
import 'package:fredy_proprio/app/data/models/resume_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_historique_course_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_resume_model.dart';

import '../models/categorie_model.dart';
import '../models/driver_model.dart';
import '../models/objet_message_model.dart';
import '../models/vehicule_model.dart';

Resultat parseResultat(responseBody) {
  print(responseBody);
  final parsed = json.decode(responseBody);
  return Resultat.fromJson(parsed);
}

List<VehiculeHistoriqueCourse> parseResultatLVHC(responseBody) {
  // final parsed = json.decode(responseBody);
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<VehiculeHistoriqueCourse>(
          (json) => VehiculeHistoriqueCourse.fromJson(json))
      .toList();
  // return VehiculeHistoriqueCourse.fromJson(parsed);
}

List<VehiculeResume> parseVehiculeresume(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<VehiculeResume>((json) => VehiculeResume.fromJson(json))
      .toList();
}

/// DECODER LES DONNEES
DashboardResumer parseDashboardResumer(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  List<DashboardResumer> res = parsed
      .map<DashboardResumer>((json) => DashboardResumer.fromJson(json))
      .toList();

  if (res.isNotEmpty) {
    return res.first;
  } else {
    return DashboardResumer();
  }
}

Financeresume parsFinanceresume(responseBody) {
  return Financeresume.fromJson(json.decode(responseBody));
}

Proprio parseProprio(responseBody) {
  return Proprio.fromJson(json.decode(responseBody));
}

/// DECODER LES DONNEES
Vehicule parseVehicules(responseBody) {
  return Vehicule.fromJson(json.decode(responseBody));
}

/// DECODER LES DONNEES
Categorie parseCategories(responseBody) {
  final parsed = json.decode(responseBody);
  return Categorie.fromJson(parsed);
}

/// DECODER LES DONNEES
Driver parseDrivers(responseBody) {
  return Driver.fromJson(json.decode(responseBody));
}

/// DECODER LES DONNEES
List<Resume> parseHistoriqueDrivers(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed.map<Resume>((json) => Resume.fromJson(json)).toList();
}

/// DECODER LES DONNEES
List<VehiculeLibre> parseVehiculeLibre(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<VehiculeLibre>((json) => VehiculeLibre.fromJson(json))
      .toList();
}

List<ObjetMessage> parseObjetMessages(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<ObjetMessage>((json) => ObjetMessage.fromJson(json))
      .toList();
}
