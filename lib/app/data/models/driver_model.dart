class Driver {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  Driver({this.bSuccess, this.message, this.etatConnexion, this.objet});

  Driver.fromJson(Map<String, dynamic> json) {
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
  String? nom;
  String? prenom;
  String? telephone;
  String? email;
  String? numeroPermis;
  String? imagePermis;
  int? idUser;
  String? cleConnexion;
  int? vehiculeId;
  String? numeroAutorisation;
  String? numeroCertificatAptitude;
  int? status;

  Objet(
      {this.id,
      this.nom,
      this.prenom,
      this.telephone,
      this.email,
      this.numeroPermis,
      this.imagePermis,
      this.idUser,
      this.cleConnexion,
      this.vehiculeId,
      this.numeroAutorisation,
      this.numeroCertificatAptitude,
      this.status});

  Objet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    email = json['email'];
    numeroPermis = json['numero_permis'];
    imagePermis = json['image_permis'];
    idUser = json['id_user'];
    cleConnexion = json['cle_connexion'];
    vehiculeId = json['vehicule_id'];
    numeroAutorisation = json['numero_autorisation '];
    numeroCertificatAptitude = json['numero_certificat_aptitude'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['telephone'] = telephone;
    data['email'] = email;
    data['numero_permis'] = numeroPermis;
    data['image_permis'] = imagePermis;
    data['id_user'] = idUser;
    data['cle_connexion'] = cleConnexion;
    data['vehicule_id'] = vehiculeId;
    data['numero_autorisation '] = numeroAutorisation;
    data['numero_certificat_aptitude'] = numeroCertificatAptitude;
    data['status'] = status;
    return data;
  }
}
