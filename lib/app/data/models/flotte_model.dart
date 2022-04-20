class Flotte {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  Flotte({this.bSuccess, this.message, this.etatConnexion, this.objet});

  Flotte.fromJson(Map<String, dynamic> json) {
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
  String? lien;

  Objet({this.lien});

  Objet.fromJson(Map<String, dynamic> json) {
    lien = json['lien'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lien'] = lien;
    return data;
  }
}
