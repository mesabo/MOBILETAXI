class ObjetMessage {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  ObjetMessage({this.bSuccess, this.message, this.etatConnexion, this.objet});

  ObjetMessage.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? libelle;

  Objet({this.id, this.libelle});

  Objet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['libelle'] = libelle;
    return data;
  }
}
