class Resume {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  Resume({this.bSuccess, this.message, this.etatConnexion, this.objet});

  Resume.fromJson(Map<String, dynamic> json) {
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
  int? duree;
  String? montant;
  double? distance;
  String? date;
  String? espece;
  String? dematerialise;

  Objet(
      {this.duree,
      this.montant,
      this.distance,
      this.date,
      this.espece,
      this.dematerialise});

  Objet.fromJson(Map<String, dynamic> json) {
    duree = json['duree'];
    montant = json['montant'];
    distance = json['distance'];
    date = json['date'];
    espece = json['espece'];
    dematerialise = json['dematerialise'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['duree'] = duree;
    data['montant'] = montant;
    data['distance'] = distance;
    data['date'] = date;
    data['espece'] = espece;
    data['dematerialise'] = dematerialise;
    return data;
  }
}
