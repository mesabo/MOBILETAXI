class Vehicule {
  int? id;
  String? immatriculation;
  String? marque;
  String? modele;
  String? couleur;
  String? annee;
  String? categorie;
  String? numeroAssurance;
  String? numeroVignette;
  String? numeroCarteTransport;
  int? status;
  VehiculeLibre? vehiculeLibre;

  Vehicule(
      {this.id,
      this.immatriculation,
      this.marque,
      this.modele,
      this.couleur,
      this.annee,
      this.categorie,
      this.numeroAssurance,
      this.numeroVignette,
      this.numeroCarteTransport,
      this.status,
      this.vehiculeLibre});

  Vehicule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    immatriculation = json['immatriculation'];
    marque = json['marque'];
    modele = json['modele'];
    couleur = json['couleur'];
    annee = json['annee'];
    categorie = json['categorie'];
    numeroAssurance = json['numero_assurance'];
    numeroVignette = json['numero_vignette'];
    numeroCarteTransport = json['numero_carte_transport'];
    status = json['status'];
    vehiculeLibre = json['VehiculeLibre'] != null
        ? VehiculeLibre?.fromJson(json['VehiculeLibre'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['immatriculation'] = immatriculation;
    data['marque'] = marque;
    data['modele'] = modele;
    data['couleur'] = couleur;
    data['annee'] = annee;
    data['categorie'] = categorie;
    data['numero_assurance'] = numeroAssurance;
    data['numero_vignette'] = numeroVignette;
    data['numero_carte_transport'] = numeroCarteTransport;
    data['status'] = status;
    if (vehiculeLibre != null) {
      data['VehiculeLibre'] = vehiculeLibre?.toJson();
    }
    return data;
  }
}

class VehiculeLibre {
  int? id;
  String? immatriculation;
  int? categorieId;
  int? proprietaireId;
  dynamic chauffeurId;
  String? marque;
  String? modele;
  String? couleur;
  String? annee;
  dynamic gpsLongitude;
  dynamic gpsLatitude;
  dynamic createdAt;
  dynamic updatedAt;
  int? statut;
  int? etat;

  VehiculeLibre(
      {this.id,
      this.immatriculation,
      this.categorieId,
      this.proprietaireId,
      this.chauffeurId,
      this.marque,
      this.modele,
      this.couleur,
      this.annee,
      this.gpsLongitude,
      this.gpsLatitude,
      this.createdAt,
      this.updatedAt,
      this.statut,
      this.etat});

  VehiculeLibre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    immatriculation = json['immatriculation'];
    categorieId = json['categorie_id'];
    proprietaireId = json['proprietaire_id'];
    chauffeurId = json['chauffeur_id'];
    marque = json['marque'];
    modele = json['modele'];
    couleur = json['couleur'];
    annee = json['annee'];
    gpsLongitude = json['gps_longitude'];
    gpsLatitude = json['gps_latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statut = json['statut'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['immatriculation'] = immatriculation;
    data['categorie_id'] = categorieId;
    data['proprietaire_id'] = proprietaireId;
    data['chauffeur_id'] = chauffeurId;
    data['marque'] = marque;
    data['modele'] = modele;
    data['couleur'] = couleur;
    data['annee'] = annee;
    data['gps_longitude'] = gpsLongitude;
    data['gps_latitude'] = gpsLatitude;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['statut'] = statut;
    data['etat'] = etat;
    return data;
  }
}
