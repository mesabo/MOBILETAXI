import 'dart:convert';

import 'package:fredy_proprio/app/data/models/dashboard_resumer_model.dart';
import 'package:fredy_proprio/app/data/models/financeresume_model.dart';
import 'package:fredy_proprio/app/data/models/proprio_model.dart';
import 'package:fredy_proprio/app/data/models/resultat_model.dart';
import 'package:fredy_proprio/app/data/models/resume_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_historique_course_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_resume_model.dart';
import 'package:fredy_proprio/app/data/models/vehicule_model.dart' as vehicule;

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

VehiculeResume parseVehiculeresume(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<VehiculeResume>((json) => VehiculeResume.fromJson(json))
      .toList();
}

/// DECODER LES DONNEES
DashboardResumer parseDashboardResumer(responseBody) {
  return DashboardResumer.fromJson(json.decode(responseBody));
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
  return parsed.map<ObjetMessage>((json) => Resume.fromJson(json)).toList();
}

/// DECODER LES DONNEES
Vehicule parseVehiculeLibre(responseBody) {
  return Vehicule.fromJson(json.decode(responseBody));
}

List<ObjetMessage> parseObjetMessages(responseBody) {
  final parsed =
      json.decode(responseBody)["objet"].cast<Map<String, dynamic>>();
  return parsed
      .map<ObjetMessage>((json) => ObjetMessage.fromJson(json))
      .toList();
}
