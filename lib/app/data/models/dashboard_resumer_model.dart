class DashboardResumer {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  DashboardResumer(
      {this.bSuccess, this.message, this.etatConnexion, this.objet});

  DashboardResumer.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
    if (json['objet'] != null) {
      objet = <Objet>[];
      json['objet'].forEach((v) {
        objet?.add(Objet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bSuccess'] = bSuccess;
    data['message'] = message;
    data['etat_connexion'] = etatConnexion;
    if (objet != null) {
      data['objet'] = objet?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Objet {
  int? montantJour;
  int? courseJour;
  int? apercevoir;
  int? areverser;
  int? nombreDriver;
  int? nombreVehicule;
  int? nombreVehculeActif;

  Objet(
      {this.montantJour,
      this.courseJour,
      this.apercevoir,
      this.areverser,
      this.nombreDriver,
      this.nombreVehicule,
      this.nombreVehculeActif});

  Objet.fromJson(Map<String, dynamic> json) {
    montantJour = json['montant_jour'];
    courseJour = json['course_jour'];
    apercevoir = json['apercevoir'];
    areverser = json['areverser'];
    nombreDriver = json['nombre_driver'];
    nombreVehicule = json['nombre_vehicule'];
    nombreVehculeActif = json['nombre_vehcule_actif'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['montant_jour'] = montantJour;
    data['course_jour'] = courseJour;
    data['apercevoir'] = apercevoir;
    data['areverser'] = areverser;
    data['nombre_driver'] = nombreDriver;
    data['nombre_vehicule'] = nombreVehicule;
    data['nombre_vehcule_actif'] = nombreVehculeActif;
    return data;
  }
}
