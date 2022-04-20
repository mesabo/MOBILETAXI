class Vehicule {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  Vehicule({this.bSuccess, this.message, this.etatConnexion, this.objet});

  Vehicule.fromJson(Map<String, dynamic> json) {
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
  String? immatriculation;
  int? categorieId;
  int? proprietaireId;
  int? ifnullChauffeurId0;
  String? marque;
  String? modele;
  String? couleur;
  String? annee;
  bool? numeroAssurance;
  bool? numeroVignette;
  String? numeroCarteTransport;
  int? gpsLongitude;
  int? gpsLatitude;
  String? createdAt;
  int? statut;
  int? etatVehicule;

  Objet(
      {this.id,
      this.immatriculation,
      this.categorieId,
      this.proprietaireId,
      this.ifnullChauffeurId0,
      this.marque,
      this.modele,
      this.couleur,
      this.annee,
      this.numeroAssurance,
      this.numeroVignette,
      this.numeroCarteTransport,
      this.gpsLongitude,
      this.gpsLatitude,
      this.createdAt,
      this.statut,
      this.etatVehicule});

  Objet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    immatriculation = json['immatriculation'];
    categorieId = json['categorie_id'];
    proprietaireId = json['proprietaire_id'];
    ifnullChauffeurId0 = json['ifnull(chauffeur_id,0)'];
    marque = json['marque'];
    modele = json['modele'];
    couleur = json['couleur'];
    annee = json['annee'];
    numeroAssurance = json['numero_assurance'];
    numeroVignette = json['numero_vignette'];
    numeroCarteTransport = json['numero_carte_transport'];
    gpsLongitude = json['gps_longitude'];
    gpsLatitude = json['gps_latitude'];
    createdAt = json['created_at'];
    statut = json['statut'];
    etatVehicule = json['etat_vehicule'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['immatriculation'] = immatriculation;
    data['categorie_id'] = categorieId;
    data['proprietaire_id'] = proprietaireId;
    data['ifnull(chauffeur_id,0)'] = ifnullChauffeurId0;
    data['marque'] = marque;
    data['modele'] = modele;
    data['couleur'] = couleur;
    data['annee'] = annee;
    data['numero_assurance'] = numeroAssurance;
    data['numero_vignette'] = numeroVignette;
    data['numero_carte_transport'] = numeroCarteTransport;
    data['gps_longitude'] = gpsLongitude;
    data['gps_latitude'] = gpsLatitude;
    data['created_at'] = createdAt;
    data['statut'] = statut;
    data['etat_vehicule'] = etatVehicule;
    return data;
  }
}
