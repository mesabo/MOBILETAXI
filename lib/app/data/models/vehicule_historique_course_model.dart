class VehiculeHistoriqueCourse {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  String? totaux;
  String? espece;
  String? dematerialise;
  List<Objet>? objet;

  VehiculeHistoriqueCourse(
      {this.bSuccess,
      this.message,
      this.etatConnexion,
      this.totaux,
      this.espece,
      this.dematerialise,
      this.objet});

  VehiculeHistoriqueCourse.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
    totaux = json['totaux'];
    espece = json['espece'];
    dematerialise = json['dematerialise'];
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
    data['totaux'] = totaux;
    data['espece'] = espece;
    data['dematerialise'] = dematerialise;
    if (objet != null) {
      data['objet'] = objet?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Objet {
  int? duree;
  double? distance;
  String? montant;
  String? date;
  String? typePaiement;

  Objet(
      {this.duree, this.distance, this.montant, this.date, this.typePaiement});

  Objet.fromJson(Map<String, dynamic> json) {
    duree = json['duree'];
    distance = json['distance'];
    montant = json['montant'];
    date = json['date'];
    typePaiement = json['type_paiement'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['duree'] = duree;
    data['distance'] = distance;
    data['montant'] = montant;
    data['date'] = date;
    data['type_paiement'] = typePaiement;
    return data;
  }
}
